provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
  org_integration      = true
  organization_id      = "889612674382"
  project_id = "lwint-mikelaramie"
  enable_ubla          = true
  lifecycle_rule_age   = 7
  exclude_folders      = true
  folders_to_exclude   = [
    "folders/578370918314", 
    "folders/1099205162015",
  ] 
}