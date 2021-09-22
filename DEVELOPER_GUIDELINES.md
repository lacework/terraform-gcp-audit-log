## Terraform Modules Developer Guidelines

### Installation
It is recommended to use tfenv or tfswitch. This makes managing and switching between Terraform versions quick and easy.

***TFenv***

```brew install tfenv```
To get up and running with TFenv refer to the Usage section of the README

***TFSwitch***

```brew install warrensbox/tap/tfswitch```
To get up and running with TFSwitch refer to the documentation

***Indentation***

Use two spaces, no tabs.

```hcl
resource "aws_instance" "example" {
  ami = "abc123"

  network_interface {
    # ...
  }
}
```

***Comments***

Our best practice is to add a comment for every resource declared. This comment should explain what the resource is doing and how it interconnects with other resources. Hashicorp recommends using # for single-line comments.

Here is an example of a resource with its comment:

```hcl
# Create the Lacework application within Azure Active Directory to grant
# access to Azure Storage, Azure Key Vault, AAD Graph API, and Microsoft Graph
resource "azuread_application" "default" {
  ...
}
```
 

***Input Variables***

Always document user-facing variables, even if your variable names are self-descriptive like api_key or account, they could be easily misinterpreted. Always add a description field with a brief explanation.

A couple of examples:


```hcl
variable "account" {
  type        = string
  description = "Lacework account subdomain of URL (i.e. <ACCOUNT>.lacework.net)"
}
```

```hcl
variable "api_key" {
  type        = string
  description = "A Lacework API access key"
}
```
Additionally, any required variables like api keys, or required tagging should not have default values, and should require the user to input those either manually each run, or optimally using a terraform.tfvars file

***Recommended Project File Organization***

A few best practices for organizing Terraform projects: 

* `main.tf` - Store the main structure of your terraform code in this file
* `variables.tf` - All variables for your project
* `output.tf` - All outputs in this file
* `tfvars.example` - An example terraform.tfvars file for easy cp for users (note: *.tfvars are typically 
ignored by .gitignore
* `.gitignore` - Critical to ensure that any sensitive information used in tfvars are not checked in to git


***Version Support / Documentation***

Hashicorp release frequent patch and minor updates as needed, as well as new major releases of Terraform each year. Although Hashicorp provide solid documentation on how to upgrade between major releases of Terraform, Lacework must contend with the fact that Lacework customers do not all upgrade in a timely manor. For this reason Tech Alliances Team must continue to update documentation with supported versions of Terraform, as well as update CI pipelines to test changes across each supported version. 

***Standard Versioning for Code Snippets***
All customer facing code snippets should adhere to the standard of using pessimistic version constraint to minor releases. 

```hcl
module "aws_config" {
  source  = "lacework/config/aws"
  version = "~> 0.1"
}
```
```hcl
module "aws_cloudtrail" {
  source  = "lacework/cloudtrail/aws"
  version = "~> 0.1"

  bucket_force_destroy  = true
  use_existing_iam_role = true
  iam_role_name         = module.aws_config.iam_role_name
  iam_role_arn          = module.aws_config.iam_role_arn
  iam_role_external_id  = module.aws_config.external_id
}
```

The example above will work for version 0.1.9 as well as 0.4.0, but will not pull in any major releases such as 1.0.0.

For more information visit [Semantic Versioning 2.0.0](https://semver.org/) 

## Commit message standard

The format is:

```
type(scope): subject
BODY
FOOTER
```
Each commit message consists of a header, body, and footer. The header is mandatory, the scope is optional, the type and subject are mandatory.
When writing a commit message try and limit each line of the commit to a max of 100 hundred characters, so it can be read easily.

### Type

| Type | Description |
| ----- | ----------- |
| feat: | A new feature you're adding |
| fix: |A bug fix|
| style: | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc) |
| refactor: | A code change that neither fixes a bug nor adds a feature |
| test: | Everything related to testing |
| docs: | Everything related to documentation |
| chore: | Regular code maintenance |
| build: | Changes that affect the build |
| ci: | Changes to our CI configuration files and scripts |
| perf: | A code change that improves performance |
| metric: | A change that provides better insights about the adoption of features and code statistics |

### Scope
The optional scope refers to the section that this commit belongs to, for example, changing a specific component or service, a directive, pipes, etc. 
Think about it as an indicator that will let the developers know at first glance what section of your code you are changing.

A few good examples are:

feat(client):
docs(cli):
chore(tests):
ci(directive):

### Subject
The subject should contain a short description of the change, and written in present-tense, for example, use “add” and not “added”,  or “change” and not “changed”. 
I like to fill this sentence below to understand what should I put as my description of my change:

If applied, this commit will ________________________________________.

### Body
The body should contain a longer description of the change, try not to repeat the subject and keep it in the present tense as above. 
Put as much context as you think it is needed, don’t be shy and explain your thought process, limitations, ideas for new features or fixes, etc.

### Footer
The footer is used to reference issues, pull requests or breaking changes, for example, “Fixes ticket #123”.

## Signing commits
Signed commits are required for any contribution to this project. Please see Github's documentation on configuring signed commits, [tell git about your signing key](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/telling-git-about-your-signing-key) and [signing commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
