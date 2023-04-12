# Integrate Multiple GCP Project with Lacework
The following provides an example of integrating multiple Google Cloud Project with Lacework for Cloud Audit Log analysis.

The fields required for this example are:

| Name       | Description                                                                                 | Type     |
|------------|---------------------------------------------------------------------------------------------|----------|
| `projects` | The id of each Project, which will be used to deploy required resources for the integration | `map` |


```hcl
provider "google" {
  project = keys(var.projects)[0]
}

provider "lacework" {}

variable "projects" {
  description = "Map of project configuration with Lacework."
  type        = map
  default     = {
    project-id-1 = "first project",
    project-id-2 = "second project"
  }
}

module "gcp_audit_log" {
  source = "../../"

  for_each   = var.projects
  project_id = each.key
}
```

Run Terraform:
```
$ terraform init
$ GOOGLE_CREDENTIALS=account.json GOOGLE_PROJECT=my-project terraform apply
```

For detailed information on integrating Lacework with Google Cloud see [GCP Compliance and Audit Trail Integration - Configure Multiple Porjects with Terraform](https://docs.lacework.com/onboarding/gcp-compliance-and-audit-log-integration-terraform-using-google-cloud-shell#configure-multiple-projects-with-terraform)
