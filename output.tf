output "service_account_name" {
  value       = local.service_account_name
  description = "The Service Account name"
}

output "service_account_private_key" {
  value       = length(var.service_account_private_key) > 0 ? var.service_account_private_key : module.lacework_at_svc_account.private_key
  description = "The private key in JSON format, base64 encoded"
  sensitive   = true
}

output "bucket_name" {
  value       = local.bucket_name
  description = "The storage bucket name"
}

output "pubsub_topic_name" {
  value       = google_pubsub_topic.lacework_topic.name
  description = "The PubSub topic name"
}

output "sink_name" {
  value       = local.sink_name
  description = "The sink name"
}

output "existing_sink_warning" {
  value       = length(var.existing_sink_name) > 0 && length(var.existing_bucket_name) > 0 ? "When using a pre-existing sink and pre-existing storage bucket, customers must ensure the bucket is configured as the destination for the sink!" : ""
  description = "Warning for customers using pre-existing sink and bucket"
}