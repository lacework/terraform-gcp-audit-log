provider "google" {}

provider "lacework" {}

module "gcp_project_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
  enable_ubla          = true
  lifecycle_rule_age   = 7
}
