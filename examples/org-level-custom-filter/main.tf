provider "google" {}

provider "lacework" {}

variable "organization_id" {
  default = "my-organization-id"
}

module "gcp_organization_level_audit_log" {
  source = "../../"

  org_integration    = true
  organization_id    = var.organization_id
  enable_ubla        = true
  lifecycle_rule_age = 7
  custom_filter      = "(protoPayload.@type=type.googleapis.com/google.cloud.audit.AuditLog) AND NOT (protoPayload.methodName:\"storage.objects\") AND (logName =~ \"folders\" OR logName =~ \"organizations\")"
}
