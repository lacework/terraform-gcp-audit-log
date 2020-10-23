provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
}
