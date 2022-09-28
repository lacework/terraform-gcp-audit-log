provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source                       = "../../"
  bucket_force_destroy         = true
  use_existing_service_account = true
  service_account_name         = "my-service-account-name"
  service_account_private_key  = "my-private-key"
  skip_iam_grants              = true 
  topic_name                   = "google-pubsub-topic-name"
  topic_id                     = "google-pubsub-topic-id"
  subscription_id              = "google-pubsub-subscription-id"
  existing_bucket_name         = "google-storage-bucket-name"
  existing_sink_name           = "google-logging-project-sink-name"
  wait_time                    = "60s"
}
