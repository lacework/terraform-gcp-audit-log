# Integrate GCP Organization with Lacework using Existing Service Account
The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis using an existing log sink and cloud storage bucket.

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
  version              = "~> 3.0"
  org_integration      = true
  organization_id      = "my-organization-id"
  existing_bucket_name = "my-existing-bucket-name"
  existing_sink_name   = "my-existing-sink-name"
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)
