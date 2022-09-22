# Integrate GCP Organization with Lacework using Existing Service Account and Skip Iam Grants

The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis using an existing service account and no skipping additional iam grants.

Skip Iam Grants requires
- Supplying your own service account with correct roles. For details see [Here](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host) 
- Supplying your own Topic. The Service Account supplied must have  `roles/pubsub.publisher`
- Supplying your own Subscription. The Service Account supplied must have `roles/pubsub.subscriber`

```hcl
provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source                       = "../../"
  bucket_force_destroy         = true
  use_existing_service_account = true
  service_account_name         = "my-service-account"
  service_account_private_key  = "my-private-key"
  skip_iam_grants              = true 
  topic_name                   = "lacework-topic-name"
  subscription_id              = "lacework-subscription-id"
}
```