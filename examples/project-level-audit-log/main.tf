provider "google" {}

provider "lacework" {}

module "gcp_project_level_audit_log" {
  source = "../../"

  lifecycle_rule_age = 7
}
