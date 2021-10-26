provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source                       = "../../"
  org_integration              = true
  organization_id              = "my-organization-id"
  existing_bucket_name         = "my-existing-bucket-name"
  existing_sink_name           = "my-existing-sink-name"
}
