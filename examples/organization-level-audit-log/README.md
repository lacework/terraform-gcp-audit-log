# Integrate GCP Organziation with Lacework
The following provides an example of integrating a Google Cloud Organization with Lacework for GCP Audit Log analysis.

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
  source               = "lacework/audit-log/gcp"
  version              = "~> 0.1.1"
  bucket_force_destroy = true
  org_integration      = true
  organization_id      = "my-organization-id"
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)