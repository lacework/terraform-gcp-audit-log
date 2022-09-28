# Integrate GCP Organization with Lacework using Existing Service Account and Skip Iam Grants

The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis using an existing service account and no skipping additional iam grants.

Skip Iam Grants requires
- Supplying your own service account with correct roles. For details see [Here](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host) 
- Supplying your own Topic.
- Supplying your own Subscription.
- Supplying your own Storage Bucket. 
- Supplying your own Log Sink.

```hcl
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
```