# Contributing to the Lacework Terraform Modules

### Table Of Contents

* [Before getting started?](#before-getting-started)

* [How to Contribute?](#how-can-i-contribute)
    * [Reporting Bugs](#reporting-bugs)
    * [Feature Requests](#feature-requests)
    * [Pull Requests](#creating-a-pull-request)

* [Developer Guidelines](/DEVELOPER_GUIDELINES.md)


## Before getting started

Read the [README.md](README.md) and
 Hashicorps [best practices and syntax guidelines](https://www.terraform.io/docs/configuration/index.html)

## Reporting Bugs

Ensure the issue you are raising has not already been created under [issues](https://github.com/lacework/terraform-gcp-audit-log/issues).
If no current issue addresses the problem, open a new [issue](https://github.com/lacework/terraform-gcp-audit-log/issues/new).
Include as much relevant information as possible. See the [bug template](https://github.com/lacework/terraform-gcp-audit-log/blob/main/.github/ISSUE_TEMPLATE/bug_report.md) for help on creating a new issue.

## Feature Requests

If you wish to submit a request to add new functionality or an improvement to a terraform module then use the the [feature request](https://github.com/lacework/terraform-gcp-audit-log/blob/main/.github/ISSUE_TEMPLATE/feature_request.md) template to 
open a new [issue](https://github.com/lacework/terraform-gcp-audit-log/issues/new)

## Creating a Pull Request

If you have made a change or added new functionality, you can submit a pull request. The project maintainers will aim to review in a 2 week timeframe. When submitting a pull request please read the [developer guidelines](/DEVELOPER_GUIDELINES.md)

The examples folder contains Terraform code that run as part of the CI pipeline. A new pull request will trigger this test run to ensure no breaking changes are added. We recommended sanity checking your own Terraform changes before submitting the change for review.


Thanks,

Project Maintainers