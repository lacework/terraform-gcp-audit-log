# Integrate GCP Organization with Lacework
The following provides an example of integrating a Google Cloud Organization with Lacework for Cloud Audit Log analysis, excluding 2 folders from the root integration.

```hcl
terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

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
  folders_to_exclude   = [
    "folders/578370918314", 
    "folders/1099205162015",
  ] 
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)