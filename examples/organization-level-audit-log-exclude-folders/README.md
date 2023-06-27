# Integrate GCP Organization with Lacework Excluding Folder(s)

The following provides an example of integrating a Google Cloud Organization with Lacework for Cloud
Audit Log analysis, excluding 2 folders from the root integration.

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
  source  = "lacework/audit-log/gcp"
  version = "~> 3.4"

  org_integration    = true
  organization_id    = "my-organization-id"
  enable_ubla        = true
  lifecycle_rule_age = 7

  folders_to_exclude = [
    "folders/578370918314",
    "folders/1099205162015"
  ]
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)
