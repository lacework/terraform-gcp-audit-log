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
provider "google" {}

provider "lacework" {}

module "gcp_project_audit_log" {
  source               = "../../"
  bucket_force_destroy = true
}
