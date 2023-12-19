# Integrate GCP Folders with Lacework at the Organization level

The following provides an example of integrating two Google Cloud Folders with Lacework for Cloud
Audit Log analysis at the Organization level.

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
  version = "~> 4.0"

  org_integration    = true
  project_id         = "abc-demo-project-123"
  organization_id    = var.organization_id
  lifecycle_rule_age = 7

  folders_to_include = [
    "folders/123456789012",
    "folders/345678901234"
  ]
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)

