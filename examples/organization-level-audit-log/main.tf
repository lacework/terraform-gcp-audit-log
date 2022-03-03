provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
  org_integration      = true
  organization_id      = var.organization_id
  enable_ubla          = true
  lifecycle_rule_age   = 7
}
