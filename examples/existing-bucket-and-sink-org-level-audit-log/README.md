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
  source                       = "../../"
  org_integration              = true
  organization_id              = "my-organization-id"
  existing_bucket_name         = "my-existing-bucket-name"
  existing_sink_name           = "my-existing-sink-name"
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
