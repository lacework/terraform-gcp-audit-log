# Integrate GCP Project with Lacework
The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis.

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

module "gcp_project_level_audit_log" {
  source  = "lacework/audit-log/gcp"
  version = "~> 3.0"

  lifecycle_rule_age = 7
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)
