# Integrate GCP Organziation with Lacework using Existing Service Account
The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis using an existing service account.

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
  source                       = "lacework/audit-log/gcp"
  version                      = "~> 0.1.1"
  bucket_force_destroy         = true
  use_existing_service_account = true
  service_account_name         = "my-service-account"
  service_account_private_key  = "ewogICJwcm9qZWN0X2lkIjogInNlY3JldCIsCiAgInByaXZhdGVfa2V5X2lkIjogIkdvdCB5YSEiLAogICJwcml2YXRlX2tleSI6ICJZb3Ugc2hvdWxkbid0IGJlIHJlYWRpbmcgdGhpcyBpbmZvcm1hdGlvbiA6LSkiLAogICJjbGllbnRfZW1haWwiOiAibm90QHZlcnkubmljZSIsCiAgImNsaWVudF9pZCI6ICIxMjM0Igp9Cg=="
  org_integration              = true
  organization_id              = "my-organization-id"
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
