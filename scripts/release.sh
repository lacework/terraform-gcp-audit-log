#!/bin/bash
#
# Name::        release.sh
# Description:: Use this script to prepare a new release on Github,
#               the automation will create a GH tag like 'v0.1.0'
#               (using the VERSION file)
# Author::      Salim Afiune Maya (<afiune@lacework.net>)
#
set -eou pipefail

# common release functions
source scripts/release_helpers.sh

# Required Variables
readonly org_name=lacework
readonly project_name=terraform-gcp-audit-log
readonly git_user="Lacework Inc."
readonly git_email="tech-ally@lacework.net"
readonly required_files_for_release=(
  RELEASE_NOTES.md
  CHANGELOG.md
  VERSION
)
readonly main_branch=main

# Variable that changes during release
VERSION=$(cat VERSION)

usage() {
  local _cmd
  _cmd="$(basename "${0}")"
  cat <<USAGE
${_cmd}: A tool that helps you do releases!

Use this script to prepare a new Github release, the automation will generate
release notes, update the changelog and create a Github tag like 'v0.1.0'.

USAGE:
    ${_cmd} [command]

COMMANDS:
    prepare    Generates release notes, updates version and CHANGELOG.md
    verify     Check if the release is ready to be applied
    trigger    Trigger a release by creating a git tag
    publish    Creates a Github tag like 'v0.1.0'
USAGE
}

main() {
  case "${1:-}" in
    prepare)
      prepare_release
      ;;
    publish)
      publish_release
      ;;
    verify)
      verify_release
      ;;
    trigger)
      trigger_release
      ;;
    *)
      usage
      ;;
  esac
}

main "$@" || exit 99
