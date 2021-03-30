variable "required_apis" {
  type = map(any)
  default = {
    iam               = "iam.googleapis.com"
    pubsub            = "pubsub.googleapis.com"
    serviceusage      = "serviceusage.googleapis.com"
    resourcemanager   = "cloudresourcemanager.googleapis.com"
  }
}

variable "org_integration" {
  type        = bool
  default     = false
  description = "If set to true, configure an organization level integration"
}

variable "organization_id" {
  type        = string
  default     = ""
  description = "The organization ID, required if org_integration is set to true"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "A project ID different from the default defined inside the provider"
}

variable "use_existing_service_account" {
  type        = bool
  default     = false
  description = "Set this to true to use an existing Service Account"
}

variable "service_account_name" {
  type        = string
  default     = ""
  description = "The Service Account name (required when use_existing_service_account is set to true)"
}

variable "service_account_private_key" {
  type        = string
  default     = ""
  description = "The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)"
}

variable "existing_bucket_name" {
  type        = string
  default     = ""
  description = "The name of an existing bucket you want to send the logs to"
}

variable "bucket_force_destroy" {
  type    = bool
  default = false
}

variable "prefix" {
  type        = string
  default     = "lw-at"
  description = "The prefix that will be use at the beginning of every generated resource"
}

variable "lacework_integration_name" {
  type    = string
  default = "TF audit_log"
}

variable "wait_time" {
  type        = string
  default     = "10s"
  description = "Amount of time to wait before the next resource is provisioned."
}

variable "enable_ubla" {
  description = "Boolean for enabled Uniform Bucket Level Access on the audit log bucket"
  type        = bool
  default     = false
}

variable "lifecycle_rule_age" {
  description = "Number of days to keep audit logs in Lacework GCS bucket before deleting.  Leave null to keep indefinitely"
  type        = number
  default     = null
}