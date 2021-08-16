<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-gcp-audit-log

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-gcp-audit-log.svg)](https://github.com/lacework/terraform-gcp-audit-log/releases/)
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)]( https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

Terraform module for configuring an integration with Google Cloud Platform Organizations and Projects for Audit Logs analysis.

:warning: - **NOTE:** When using an existing Service Account, Terraform cannot work out whether a role has already been applied.
This means when running the destroy step, existing roles may be removed from the Service Account. If this Service Account
is managed by  another Terraform module, you can re-run apply on the other module and this will re-add the role.

Alternatively, it is possible to remove the offending roles from the state file before destroy, preventing the role(s)
from being removed.

e.g. `terraform state rm 'google_project_iam_binding.for_lacework_service_account'`

## Required Roles
```
roles/storage.objectViewer
```

## Required APIs
```
iam.googleapis.com
pubsub.googleapis.com
serviceusage.googleapis.com
cloudresourcemanager.googleapis.com
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
|org_integration|If set to true, configure an organization level integration|bool|false|false|
|organization_id|The organization ID, required if org_integration is set to true|string|""|false|
|project_id|A project ID different from the default defined inside the provider|string|""|false|
|use_existing_service_account|Set this to true to use an existing Service Account. When using an existing service account, the required roles must be added manually.|bool|false|false|
|service_account_name|The Service Account name (required when use_existing_service_account is set to true). This can also be used to specify the new service account name when use_existing_service_account is set to false|string|""|false|
|service_account_private_key|The private key in JSON format, base64 encoded (required when use_existing_service_account is set to true)|string|""|false|
|existing_bucket_name|The name of an existing bucket you want to send the logs to|string|""|false|
|bucket_region|The region where the new bucket will be created, valid values for Multi-regions are (EU, US or ASIA) alternatively you can set a single region or Dual-regions follow the naming convention as outlined in the GCP bucket locations documentation https://cloud.google.com/storage/docs/locations#available-locations|string|US|false|
|bucket_force_destroy|Whether to force destroy the bucket and ignore any content.|bool|false|false|
|lacework_integration_name|The integration name displayed in the Lacework UI.|string|TF audit_log|false|
|required_apis|The APIs that should be enabled for this integration to be successful.|map(any)|See the Required APIs section|false|
|prefix|The prefix that will be used at the beginning of every generated resource|string|lw-at|false|
|wait_time|Amount of time to wait before the next resource is provisioned.|string|10s|false|
|enable_ubla|Boolean for enabled Uniform Bucket Level Access on the audit log bucket|bool|false|false|
|lifecycle_rule_age|Number of days to keep audit logs in Lacework GCS bucket before deleting.  Leave null to keep indefinitely|number|null|false|



## Outputs

| Name | Description |
|------|-------------|
|service_account_name|The Service Account name|
|service_account_private_key|The private key in JSON format, base64 encoded|
|bucket_name|The storage bucket name|
|pubsub_topic_name|The PubSub topic name|
