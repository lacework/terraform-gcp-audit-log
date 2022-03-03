provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
  org_integration      = true
  organization_id      = "my-organization-id"
  enable_ubla          = true
  lifecycle_rule_age   = 7
  exclude_folders      = true
  folders_to_exclude = [
    "folders/123456789012",
    "folders/345678901234",
  ]
}
