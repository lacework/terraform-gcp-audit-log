locals {
  resource_level = var.org_integration ? "ORGANIZATION" : "PROJECT"
  resource_id    = var.org_integration ? var.organization_id : module.lacework_at_svc_account.project_id
  project_id     = data.google_project.selected.project_id
  bucket_name = length(var.existing_bucket_name) > 0 ? var.existing_bucket_name : (
    length(google_storage_bucket.lacework_bucket) > 0 ? google_storage_bucket.lacework_bucket[0].name : var.existing_bucket_name
  )
  logging_sink_writer_identity = var.org_integration ? (
    google_logging_organization_sink.lacework_organization_sink[0].writer_identity
    ) : (
    google_logging_project_sink.lacework_project_sink[0].writer_identity
  )
  service_account_name = var.use_existing_service_account ? (
    var.service_account_name
    ) : (
    length(var.service_account_name) > 0 ? var.service_account_name : "${var.prefix}-${random_id.uniq.hex}"
  )
  service_account_json_key = jsondecode(var.use_existing_service_account ? (
    base64decode(var.service_account_private_key)
    ) : (
    base64decode(module.lacework_at_svc_account.private_key)
  ))
  bucket_roles = {
    "roles/storage.objectViewer"       = ["serviceAccount:${local.service_account_json_key.client_email}"]
    "roles/storage.objectCreator"      = [local.logging_sink_writer_identity]
    "roles/storage.legacyBucketReader" = ["projectViewer:${local.project_id}"]
    "roles/storage.legacyBucketOwner" = [
      "projectEditor:${local.project_id}",
      "projectOwner:${local.project_id}"
    ]
  }
  default_audit_log_roles = [
    "roles/storage.objectViewer"
  ]
}

resource "random_id" "uniq" {
  byte_length = 4
}

data "google_project" "selected" {
  project_id = var.project_id
}

resource "google_project_service" "required_apis" {
  for_each = var.required_apis
  project  = local.project_id
  service  = each.value

  disable_on_destroy = false
}

module "lacework_at_svc_account" {
  source               = "lacework/service-account/gcp"
  version              = "~> 1.0"
  create               = var.use_existing_service_account ? false : true
  service_account_name = local.service_account_name
  project_id           = local.project_id
}

resource "google_storage_bucket" "lacework_bucket" {
  count                       = length(var.existing_bucket_name) > 0 ? 0 : 1
  project                     = local.project_id
  name                        = "${var.prefix}-lacework-bucket-${random_id.uniq.hex}"
  force_destroy               = var.bucket_force_destroy
  depends_on                  = [google_project_service.required_apis]
  uniform_bucket_level_access = var.enable_ubla
  dynamic "lifecycle_rule" {
    for_each = compact([var.lifecycle_rule_age])
    content {
      condition {
        age = var.lifecycle_rule_age
      }
      action {
        type = "Delete"
      }
    }
  }
}

resource "google_storage_bucket_iam_binding" "policies" {
  for_each = local.bucket_roles
  role     = each.key
  members  = each.value
  bucket   = local.bucket_name
}

resource "google_pubsub_topic" "lacework_topic" {
  name       = "${var.prefix}-lacework-topic-${random_id.uniq.hex}"
  project    = local.project_id
  depends_on = [google_project_service.required_apis]
}

# By calling this data source we are accessing the storage service
# account and therefore, Google will created for us. If we don't
# ask for it, Google doesn't create it by default, more docs at:
# => https://cloud.google.com/storage/docs/projects#service-accounts
#
# If the service account is not there, we could add a local-exec
# provisioner to call an API that is documented at:
# => https://cloud.google.com/storage-transfer/docs/reference/rest/v1/googleServiceAccounts/get
data "google_storage_project_service_account" "lw" {
  project = local.project_id
}

resource "google_pubsub_topic_iam_binding" "topic_publisher" {
  members = ["serviceAccount:${data.google_storage_project_service_account.lw.email_address}"]
  role    = "roles/pubsub.publisher"
  project = local.project_id
  topic   = google_pubsub_topic.lacework_topic.name
}

resource "google_pubsub_subscription" "lacework_subscription" {
  project                    = local.project_id
  name                       = "${var.prefix}-${local.project_id}-lacework-subscription-${random_id.uniq.hex}"
  topic                      = google_pubsub_topic.lacework_topic.name
  ack_deadline_seconds       = 300
  message_retention_duration = "432000s"
}

resource "google_logging_project_sink" "lacework_project_sink" {
  count                  = var.org_integration ? 0 : 1
  project                = local.project_id
  name                   = "${var.prefix}-lacework-sink-${random_id.uniq.hex}"
  destination            = "storage.googleapis.com/${local.bucket_name}"
  unique_writer_identity = true

  filter = "protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog AND NOT protoPayload.methodName:'storage.objects'"
}

resource "google_logging_organization_sink" "lacework_organization_sink" {
  count            = var.org_integration ? 1 : 0
  name             = "${var.prefix}-${var.organization_id}-lacework-sink-${random_id.uniq.hex}"
  org_id           = var.organization_id
  destination      = "storage.googleapis.com/${local.bucket_name}"
  include_children = true

  filter = "protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog AND NOT protoPayload.methodName:'storage.objects'"
}

resource "google_pubsub_subscription_iam_binding" "lacework" {
  project      = local.project_id
  role         = "roles/pubsub.subscriber"
  members      = ["serviceAccount:${local.service_account_json_key.client_email}"]
  subscription = google_pubsub_subscription.lacework_subscription.name
}

resource "google_storage_notification" "lacework_notification" {
  bucket         = local.bucket_name
  payload_format = "JSON_API_V1"
  topic          = google_pubsub_topic.lacework_topic.id
  event_types    = ["OBJECT_FINALIZE"]

  depends_on = [
    google_pubsub_topic_iam_binding.topic_publisher,
    google_storage_bucket_iam_binding.policies
  ]
}

resource "google_project_iam_member" "for_lacework_service_account" {
  for_each = toset(local.default_audit_log_roles)
  project  = local.project_id
  role     = each.value
  member   = "serviceAccount:${local.service_account_json_key.client_email}"
}

# wait for X seconds for things to settle down in the GCP side
# before trying to create the Lacework external integration
resource "time_sleep" "wait_time" {
  create_duration = var.wait_time
  depends_on = [
    google_storage_notification.lacework_notification,
    google_pubsub_subscription_iam_binding.lacework,
    module.lacework_at_svc_account,
    google_project_iam_member.for_lacework_service_account
  ]
}

resource "lacework_integration_gcp_at" "default" {
  name           = var.lacework_integration_name
  resource_id    = local.resource_id
  resource_level = local.resource_level
  subscription   = google_pubsub_subscription.lacework_subscription.id
  credentials {
    client_id      = local.service_account_json_key.client_id
    private_key_id = local.service_account_json_key.private_key_id
    client_email   = local.service_account_json_key.client_email
    private_key    = local.service_account_json_key.private_key
  }
  depends_on = [time_sleep.wait_time]
}
