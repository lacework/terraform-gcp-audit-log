provider "google" {}

provider "lacework" {}

variable "organization_id" {
  default = "my-organization-id"
}

module "gcp_organization_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
  org_integration      = true
  project_id           = "abc-demo-project-123"
  organization_id      = var.organization_id
  enable_ubla          = true
  lifecycle_rule_age   = 7
  folders_to_exclude = [
    "folders/123456789012",
    "folders/345678901234",
  ]
}
