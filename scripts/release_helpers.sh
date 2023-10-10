#
# Name::        release_helpers.sh
# Description:: A set of helper functions to be used by our release.sh script
# Author::      Salim Afiune Maya (<afiune@lacework.net>)
#

log() {
  echo "--> ${project_name}: $1"
}

warn() {
  echo "xxx ${project_name}: $1" >&2
}

trigger_release() {
  if [[ "$VERSION" =~ "-dev" ]]; then
      log "No release needed. (VERSION=${VERSION})"
      log ""
      log "Read more about the release process at:"
      log "  - https://github.com/${org_name}/${project_name}/wiki/Release-Process"
    else
      log "VERSION ready to be released to 'x.y.z' tag. Triggering a release!"
      log ""
      tag_release
      sleep 5 # just so github has the new tag available
      bump_version
  fi
}

tag_release() {
  local _tag="v$VERSION"
  log "creating github tag: $_tag"
  git tag "$_tag"
  git push origin "$_tag"
}

find_latest_version() {
  local _pattern="v[0-9]\+.[0-9]\+.[0-9]\+"
  local _versions
  local _latest
  _versions=$(git ls-remote --tags --quiet | grep $_pattern | tr '/' ' ' | awk '{print $NF}')
  if [ "$_versions" != "" ]; then
    _latest=$(echo "$_versions" | sed 's/v//' | tr '.' ' ' | sort -nr -k 1 -k 2 -k 3 | tr ' ' '.' | head -1)
    echo "v$_latest"
  else
    git rev-list --max-parents=0 HEAD
  fi
}

bump_version() {
  log "updating version after tagging release"
  latest_version=$(find_latest_version)

  if [[ "v$VERSION" == "$latest_version" ]]; then
    case "${1:-}" in
      major)
        echo $VERSION | awk -F. '{printf("%d.%d.%d-dev", $1+1, $2, $3)}' > VERSION
        ;;
      minor)
        echo $VERSION | awk -F. '{printf("%d.%d.%d-dev", $1, $2+1, $3)}' > VERSION
        ;;
      *)
        echo $VERSION | awk -F. '{printf("%d.%d.%d-dev", $1, $2, $3+1)}' > VERSION
        ;;
    esac
    VERSION=$(cat VERSION)
    log "version bumped from $latest_version to v$VERSION"
  else
    log "skipping version bump. Already bumped to v$VERSION"
    return
  fi

  log "commiting and pushing the version bump to github"
  if [ "$CI" != "" ]; then
    git config --global user.email $git_email
    git config --global user.name $git_user
    git config --global user.signingkey $GPG_SIGNING_KEY
  fi
  git_add_version_files
  git commit -sS -m "ci: version bump to v$VERSION"
  git push origin $main_branch
}

# @afiune explain why this is here? To override it
git_add_version_files() {
  git add VERSION
}

verify_release() {
  log "verifying new release"
  _changed_file=$(git whatchanged --name-only --pretty="" origin..HEAD)
  for f in "${required_files_for_release[@]}"; do
    if [[ "$_changed_file" =~ "$f" ]]; then
      log "(required) '$f' has been modified. Great!"
    else
      warn "$f needs to be updated"
      warn ""
      warn "Read more about the release process at:"
      warn "  - https://github.com/${org_name}/${project_name}/wiki/Release-Process"
      exit 123
    fi
  done

  if [[ "$VERSION" =~ "-dev" ]]; then
      warn "the 'VERSION' needs to be cleaned up to be only 'x.y.z' tag"
      warn ""
      warn "Read more about the release process at:"
      warn "  - https://github.com/${org_name}/${project_name}/wiki/Release-Process"
      exit 123
    else
      log "(required) VERSION has been cleaned up to 'x.y.z' tag. Great!"
  fi
}

publish_release() {
  log "releasing v$VERSION"
  create_release
}

create_release() {
  local _tag
  _tag=$(git describe --tags)
  local _body="/tmp/release.json"

  log "generating GH release $_tag"
  generate_release_body "$_body"
  curl -XPOST -H "Authorization: token $GITHUB_TOKEN" --data  "@$_body" \
        https://api.github.com/repos/${org_name}/${project_name}/releases

  log "the release has been completed!"
  log ""
  log " -> https://github.com/${org_name}/${project_name}/releases/tag/${_tag}"
}

prepare_release() {
  log "preparing new release"
  prerequisites
  remove_tag_version
  check_for_minor_version_bump
  generate_readme
  generate_release_notes
  update_changelog
  push_release
  open_pull_request
}

push_release() {
  log "commiting and pushing the release to github"
  _version_no_tag=$(echo $VERSION | awk -F. '{printf("%d.%d.%d", $1, $2, $3)}')
  if [ "$CI" != "" ]; then
    git config --global user.email $git_email
    git config --global user.name $git_user
    git config --global user.signingkey $GPG_SIGNING_KEY
  fi
  git checkout -B release
  git commit -sS -am "release: v$_version_no_tag"
  git push origin release -f
}

open_pull_request() {
  local _body="/tmp/pr.json"
  local _pr="/tmp/pr.out"

  log "opening GH pull request"
  generate_pr_body "$_body"
  curl -XPOST -H "Authorization: token $GITHUB_TOKEN" --data  "@$_body" \
        https://api.github.com/repos/${org_name}/${project_name}/pulls > $_pr

  _pr_url=$(jq .html_url $_pr)
  log ""
  log "It is time to review the release!"
  log "    $_pr_url"
}

update_changelog() {
  log "updating CHANGELOG.md"
  _changelog=$(cat CHANGELOG.md)
  echo "# v$VERSION" > CHANGELOG.md
  echo "" >> CHANGELOG.md
  echo "$(cat CHANGES.md)" >> CHANGELOG.md
  echo "---" >> CHANGELOG.md
  echo "$_changelog" >> CHANGELOG.md
  # clean changes file since we don't need it anymore
  rm CHANGES.md
}

generate_release_notes() {
  log "generating release notes at RELEASE_NOTES.md"
  load_list_of_changes
  echo "# Release Notes" > RELEASE_NOTES.md
  echo "Another day, another release. These are the release notes for the version \`v$VERSION\`." >> RELEASE_NOTES.md
  echo "" >> RELEASE_NOTES.md
  echo "$(cat CHANGES.md)" >> RELEASE_NOTES.md
}

generate_readme() {
  make terraform-docs
}

load_list_of_changes() {
  latest_version=$(find_latest_version)
  local _list_of_changes=$(git log --no-merges --pretty="* %s (%an)([%h](https://github.com/${org_name}/${project_name}/commit/%H))" ${latest_version}..${main_branch})

  # init changes file
  true > CHANGES.md

  _feat=$(echo "$_list_of_changes" | grep "\* feat[:(]")
  _refactor=$(echo "$_list_of_changes" | grep "\* refactor[:(]")
  _perf=$(echo "$_list_of_changes" | grep "\* perf[:(]")
  _fix=$(echo "$_list_of_changes" | grep "\* fix[:(]")
  _doc=$(echo "$_list_of_changes" | grep "\* doc[:(]")
  _docs=$(echo "$_list_of_changes" | grep "\* docs[:(]")
  _style=$(echo "$_list_of_changes" | grep "\* style[:(]")
  _chore=$(echo "$_list_of_changes" | grep "\* chore[:(]")
  _build=$(echo "$_list_of_changes" | grep "\* build[:(]")
  _ci=$(echo "$_list_of_changes" | grep "\* ci[:(]")
  _test=$(echo "$_list_of_changes" | grep "\* test[:(]")

  if [ "$_feat" != "" ]; then
    echo "## Features" >> CHANGES.md
    echo "$_feat" >> CHANGES.md
  fi

  if [ "$_refactor" != "" ]; then
    echo "## Refactor" >> CHANGES.md
    echo "$_refactor" >> CHANGES.md
  fi

  if [ "$_perf" != "" ]; then
    echo "## Performance Improvements" >> CHANGES.md
    echo "$_perf" >> CHANGES.md
  fi

  if [ "$_fix" != "" ]; then
    echo "## Bug Fixes" >> CHANGES.md
    echo "$_fix" >> CHANGES.md
  fi

  if [ "${_docs}${_doc}" != "" ]; then
    echo "## Documentation Updates" >> CHANGES.md
    if [ "$_doc" != "" ]; then echo "$_doc" >> CHANGES.md; fi
    if [ "$_docs" != "" ]; then echo "$_docs" >> CHANGES.md; fi
  fi

  if [ "${_style}${_chore}${_build}${_ci}${_test}" != "" ]; then
    echo "## Other Changes" >> CHANGES.md
    if [ "$_style" != "" ]; then echo "$_style" >> CHANGES.md; fi
    if [ "$_chore" != "" ]; then echo "$_chore" >> CHANGES.md; fi
    if [ "$_build" != "" ]; then echo "$_build" >> CHANGES.md; fi
    if [ "$_ci" != "" ]; then echo "$_ci" >> CHANGES.md; fi
    if [ "$_test" != "" ]; then echo "$_test" >> CHANGES.md; fi
  fi
}

prerequisites() {
  local _branch=$(git rev-parse --abbrev-ref HEAD)
  if [ "$_branch" != "${main_branch}" ]; then
    warn "Releases must be generated from the '${main_branch}' branch. (current $_branch)"
    warn "Switch to the ${main_branch} branch and try again."
    exit 127
  fi

  local _unsaved_changes=$(git status -s)
  if [ "$_unsaved_changes" != "" ]; then
    warn "You have unsaved changes in the ${main_branch} branch. Are you resuming a release?"
    warn "To resume a release you have to start over, to remove all unsaved changes run the command:"
    warn "  git reset --hard origin/${main_branch}"
    exit 127
  fi
}

check_for_minor_version_bump() {
  if release_contains_features; then
    log "new feature detected, minor version bump"
    echo $VERSION | awk -F. '{printf("%d.%d.0", $1, $2+1)}' > VERSION
    VERSION=$(cat VERSION)
    log "updated version to v$VERSION"
  fi
}

release_contains_features() {
  latest_version=$(find_latest_version)
  git log --no-merges --pretty="%s" ${latest_version}..${main_branch} | grep "feat[:(]" >/dev/null
  return $?
}

remove_tag_version() {
  echo $VERSION | awk -F. '{printf("%d.%d.%d", $1, $2, $3)}' > VERSION
  VERSION=$(cat VERSION)
  log "updated version to v$VERSION"
}

generate_release_body() {
  _file=${1:-release.json}
  _tag=$(git describe --tags)
  _release_notes=$(jq -aRs .  <<< cat RELEASE_NOTES.md)
  cat <<EOF > $_file
{
  "tag_name": "$_tag",
  "name": "$_tag",
  "draft": false,
  "prerelease": false,
  "body": $_release_notes
}
EOF
}

generate_pr_body() {
  _file=${1:-pr.json}
  _version_no_tag=$(echo $VERSION | awk -F. '{printf("%d.%d.%d", $1, $2, $3)}')
  _release_notes=$(jq -aRs .  <<< cat RELEASE_NOTES.md)
  cat <<EOF > $_file
{
  "base": "${main_branch}",
  "head": "release",
  "title": "Release v$_version_no_tag",
  "body": $_release_notes
}
EOF
}
