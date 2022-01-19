# Integrate GCP Project with Lacework
The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis with a log bucket configured for logging of the bucket's access & storage Logs.

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
  source                    = "lacework/audit-log/gcp"
  version                   = "~> 1.0"
  bucket_force_destroy      = true
  enable_ubla               = true
  lifecycle_rule_age        = 7
  log_bucket                = "lacework-log-bucket"
  log_bucket_location       = "us-east1"
  log_bucket_retention_days = 60
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://support.lacework.com/hc/en-us/articles/360057065094-GCP-Compliance-and-Audit-Trail-Integration-Terraform-From-Any-Supported-Host)
