provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source                       = "../../"
  bucket_force_destroy         = true
  use_existing_service_account = true
  service_account_name         = "my-service-account"
  service_account_private_key  = "my-private-key"
  skip_iam_grants              = true 
  topic_name                   = google_pubsub_topic.lacework_topic.name
  subscription_id              = google_pubsub_subscription.lacework_subscription.id
}
