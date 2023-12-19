# Integrate GCP Project with Lacework using Environment Variables
The following provides an example of integrating a Google Cloud Project with Lacework for Cloud Audit Log analysis and configuring the Terraform Provider for Google and the Terraform Provider for Lacework using environment variables.

```hcl
// This template assumes the default configuration coming from the following
// environment variables:
//
// For Google's Provider:
//
// 1) GOOGLE_CREDENTIALS
// 2) GOOGLE_PROJECT
//
// For Lacework's Provider:
//
// 1) LW_ACCOUNT
// 2) LW_API_KEY
// 3) LW_API_SECRET
//
// Example of how to run this code:
//
// $ terraform init
// $ GOOGLE_CREDENTIALS=account.json \
//   GOOGLE_PROJECT=my-project       \
//   LW_ACCOUNT=my-account           \
//   LW_API_KEY=ACCOUNT_1234         \
//   LW_API_SECRET=_abcde123         \
//   terraform apply

terraform {
  required_providers {
    lacework = {
      source = "lacework/lacework"
    }
  }
}

provider "google" {}

provider "lacework" {}

module "gcp_project_audit_log" {
  source  = "lacework/audit-log/gcp"
  version = "~> 4.0"
}
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Terraform From Any Supported Host](https://docs.lacework.com/gcp-compliance-and-audit-log-integration-terraform-from-any-supported-host)
