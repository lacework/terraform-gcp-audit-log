#!/bin/bash
#
# Name::        ci_tests.sh
# Description:: Use this script to run ci tests of this repository
# Author::      Salim Afiune Maya (<afiune@lacework.net>)
#
set -eou pipefail

readonly project_name=terraform-gcp-audit-log

TEST_CASES=(
  examples/existing-bucket-and-sink-org-level-audit-log/
  examples/environment-variables-project-level-audit-log/
  examples/existing-service-account-org-level-audit-log/
  examples/organization-level-audit-log/
  examples/organization-level-audit-log-exclude-folders/
  examples/org-level-custom-filter/
  examples/org-level-google-k8s-events/
  examples/org-level-google-workspace-events/
  examples/project-level-audit-log/
)

log() {
  echo "--> ${project_name}: $1"
}

warn() {
  echo "xxx ${project_name}: $1" >&2
}

integration_tests() {
  for tcase in ${TEST_CASES[*]}; do
    log "Running tests at $tcase"
    ( cd $tcase || exit 1
      terraform init
      terraform validate
      terraform plan
    ) || exit 1
  done
}

lint_tests() {
  log "terraform fmt check"
  terraform fmt -check
}

main() {
  lint_tests
  integration_tests
}

main || exit 99
