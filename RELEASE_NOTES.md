# Release Notes
Another day, another release. These are the release notes for the version `v3.0.0`.

## Breaking Changes
* Minimum Terraform version `v0.14`
* Update Google provider to `>= 4.4.0, < 5.0.0`
* `k8s_filter` is now turned on by default, which will filter out GKE logs from GCP Audit Log sinks saving cost for our
    users since we don't currently use GKE logs
* `log_bucket` has been removed since this check was removed from the CIS benchmarks in 1.1 since the preferred method
    is to use Cloud Audit Logging. Our CIS 1.2 report reflects this change and we should be removing the 1.0 reports
    soon
* `enable_ubla` is now turned on by default, which will enable Uniform Bucket Level Access on the audit log bucket and
    put our storage bucket in compliance with CIS Benchmark 5.2

## Features
* feat: add folder exclusions (#49) (Mike Laramie)([324c8a4](https://github.com/lacework/terraform-gcp-audit-log/commit/324c8a499794f6a789d583c4c460af9475171215))
## Other Changes
* chore: update PR template (#50) (Darren)([3f31afe](https://github.com/lacework/terraform-gcp-audit-log/commit/3f31afee6248d8ab04674c12b964ed210dfd67be))
* ci: version bump to v2.6.1-dev (Lacework)([386a870](https://github.com/lacework/terraform-gcp-audit-log/commit/386a870d337224f69675fceae8d6dcf9ba733916))
