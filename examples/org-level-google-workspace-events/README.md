# Integrate GCP Organization with Lacework
The following provides an example of integrating a Google Cloud Organization with Lacework for Cloud Audit Log analysis which will include Google Workspace events.

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
  version = "~> 3.0"

  org_integration         = true
  organization_id         = "my-organization-id"
  lifecycle_rule_age      = 7
  google_workspace_filter = false
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)
