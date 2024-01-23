# v4.0.2

## Other Changes
* chore: set local var module name (#92) (Darren)([aabf208](https://github.com/lacework/terraform-gcp-audit-log/commit/aabf20855dac73ac2a42935572480e9c715eca54))
* ci: version bump to v4.0.2-dev (Lacework)([70b72b0](https://github.com/lacework/terraform-gcp-audit-log/commit/70b72b0bd46975ac49fca3e438ce45d552be042b))
---
# v4.0.1

## Other Changes
* chore: add lacework_metric_module datasource (#90) (Darren)([a7e77e6](https://github.com/lacework/terraform-gcp-audit-log/commit/a7e77e617ac0ab5901231862c647e6efa0805f0f))
* ci: version bump to v4.0.1-dev (Lacework)([588b675](https://github.com/lacework/terraform-gcp-audit-log/commit/588b6759a8d51f6420fa8d752cb2693db97babd4))
---
# v4.0.0

## Refactor
* refactor: allows upgrading the google provider to 5.x (#87) (Laurent Raufaste)([3515d8d](https://github.com/lacework/terraform-gcp-audit-log/commit/3515d8d34b0ecc1096748a6e65bd44f90e3e3e56))
## Documentation Updates
* docs(readme): add terraform docs automation (#86) (Timothy MacDonald)([781e536](https://github.com/lacework/terraform-gcp-audit-log/commit/781e53640f9d35f320c0d7260fd7fdf8b6617296))
## Other Changes
* chore: major version bump to 4.0.0 (#88) (Salim Afiune)([6199748](https://github.com/lacework/terraform-gcp-audit-log/commit/61997480f8c19e99596fb714484e2be7e45b7111))
* ci: version bump to v3.4.5-dev (Lacework)([3e7c3bd](https://github.com/lacework/terraform-gcp-audit-log/commit/3e7c3bd9e23d49efab8e3e2f00c8b20028ecb28e))
---
# v3.4.4

## Documentation Updates
* docs: multi project (#81) (jonathan stewart)([63b2659](https://github.com/lacework/terraform-gcp-audit-log/commit/63b2659dc517f1bb63a8512229218940023085f3))
## Other Changes
* chore: enable bucket_force_destroy by default (#84) (Salim Afiune)([ef49043](https://github.com/lacework/terraform-gcp-audit-log/commit/ef490437a1c15f1497974b84ff43f9963ae26013))
* chore: use pessimistic operator for google provider (#76) (Laurent Raufaste)([a1f12cb](https://github.com/lacework/terraform-gcp-audit-log/commit/a1f12cb91ae2e8a0b0a0955c5f2368bf0140b82a))
* ci: tfsec (jon-stewart)([931444b](https://github.com/lacework/terraform-gcp-audit-log/commit/931444b15deb8b3d00946f60f85268ad43f21ba4))
* ci: version bump to v3.4.4-dev (Lacework)([91cead5](https://github.com/lacework/terraform-gcp-audit-log/commit/91cead559ef636d53f7920846e907a976817fe19))
---
# v3.4.3

## Bug Fixes
* fix: avoid asking for project_id when is not needed (#79) (Salim Afiune)([eb5f4cb](https://github.com/lacework/terraform-gcp-audit-log/commit/eb5f4cbfb3317065b2b94822202c0e8a8cd14aef))
## Other Changes
* ci: version bump to v3.4.3-dev (Lacework)([68202f4](https://github.com/lacework/terraform-gcp-audit-log/commit/68202f4793a38a7f8bae2b43a42baa516f1958e9))
---
# v3.4.2

## Bug Fixes
* fix: empty project_id in google_project data source (#77) (Salim Afiune)([92261b8](https://github.com/lacework/terraform-gcp-audit-log/commit/92261b8912ca1f9ff54b7b9756194625c59182cd))
## Other Changes
* ci: version bump to v3.4.2-dev (Lacework)([91fae7a](https://github.com/lacework/terraform-gcp-audit-log/commit/91fae7af2b34c34ad70f866a3f4ff3c3249e417e))
---
# v3.4.1

## Documentation Updates
* docs: update Lacework provider version in readme (#73) (Darren)([2b10688](https://github.com/lacework/terraform-gcp-audit-log/commit/2b10688b1316201bb6f1ea07dc6b2c0ccbbcee2b))
## Other Changes
* chore: update Lacework provider version to v1 (#72) (Darren)([472ce36](https://github.com/lacework/terraform-gcp-audit-log/commit/472ce3678c9601c6898ed945b337fa0075fc1f75))
* ci: version bump to v3.4.1-dev (Lacework)([fd7eb11](https://github.com/lacework/terraform-gcp-audit-log/commit/fd7eb11e5d4743c72deec82ed371febf48143077))
---
# v3.4.0

## Features
* feat: Add folder inclusion (#68) (Mike Laramie)([6f43416](https://github.com/lacework/terraform-gcp-audit-log/commit/6f434167360520c5818d1210a0a2829b8ca6f1e2))
## Other Changes
* ci: version bump to v3.3.4-dev (Lacework)([5b824a1](https://github.com/lacework/terraform-gcp-audit-log/commit/5b824a104ea8c78cc915e301fb7f95108ab00e4a))
---
# v3.3.3

## Bug Fixes
* fix(variable): project id regex to match constraint (#65) (Salim Afiune)([15ac89d](https://github.com/lacework/terraform-gcp-audit-log/commit/15ac89dc27dfa1efc3934a525ef24ffbfcbdaa48))
## Other Changes
* ci: version bump to v3.3.3-dev (Lacework)([50c6380](https://github.com/lacework/terraform-gcp-audit-log/commit/50c638075111413a6bf186242dc7698fae811df6))
---
# v3.3.2

## Bug Fixes
* fix: set minimum version of terraform provider to 0.15.1 (#61) (Darren)([9a3dc70](https://github.com/lacework/terraform-gcp-audit-log/commit/9a3dc70c2d34e89e5a9726631a521dfc4987b47b))
## Other Changes
* ci: version bump to v3.3.2-dev (Lacework)([1966497](https://github.com/lacework/terraform-gcp-audit-log/commit/19664973ef38c3726aa41c41b66ae809e8066760))
---
# v3.3.1

## Bug Fixes
* fix: updated project role logic to respect include_root_projects (#62) (Michael Droessler)([5355f50](https://github.com/lacework/terraform-gcp-audit-log/commit/5355f5091716187ac443da28fd27c3826dd42c51))
## Other Changes
* ci: version bump to v3.3.1-dev (Lacework)([1784fa7](https://github.com/lacework/terraform-gcp-audit-log/commit/1784fa7878c977ce9b878eecb5ee20f7108769d9))
---
# v3.3.0

## Features
* feat: Default google_workspace_filter to true (Ross)([f7644be](https://github.com/lacework/terraform-gcp-audit-log/commit/f7644be9df2d10aa294e9796c5e82110dc0fad2e))
## Other Changes
* ci: version bump to v3.2.1-dev (Lacework)([b83fe53](https://github.com/lacework/terraform-gcp-audit-log/commit/b83fe53f89fc19486e57f56d45bb5b022ca3a2a5))
---
# v3.2.0

## Features
* feat: add variable to override bucket_name pattern (#57) (frits-v)([4247fc8](https://github.com/lacework/terraform-gcp-audit-log/commit/4247fc873301f3317fa53720cd4594c5074efcc5))
## Other Changes
* ci: version bump to v3.1.1-dev (Lacework)([46c54f7](https://github.com/lacework/terraform-gcp-audit-log/commit/46c54f7ee1953104a4a2e119801e527493192956))
---
# v3.1.0

## Features
* feat: customize filter options (#54) (Michael Droessler)([282c31a](https://github.com/lacework/terraform-gcp-audit-log/commit/282c31a068d524415beda5e8f5e19bcfc45dc220))
* feat: Add project id variable validation (#53) (Tim Arenz)([589f6f3](https://github.com/lacework/terraform-gcp-audit-log/commit/589f6f3e2be95b75147c5c6810f18862d59926ed))
## Other Changes
* ci: version bump to v3.0.1-dev (Lacework)([d00443a](https://github.com/lacework/terraform-gcp-audit-log/commit/d00443adaf2130a756256ff8ca6511b67650ab12))
---
# v3.0.0

## Features
* feat: add folder exclusions (#49) (Mike Laramie)([324c8a4](https://github.com/lacework/terraform-gcp-audit-log/commit/324c8a499794f6a789d583c4c460af9475171215))
## Other Changes
* chore: update PR template (#50) (Darren)([3f31afe](https://github.com/lacework/terraform-gcp-audit-log/commit/3f31afee6248d8ab04674c12b964ed210dfd67be))
* ci: version bump to v2.6.1-dev (Lacework)([386a870](https://github.com/lacework/terraform-gcp-audit-log/commit/386a870d337224f69675fceae8d6dcf9ba733916))
---
# v2.6.0

## Features
* feat: allow google provider version >= 3.0.0, < 5.0.0 (#47) (Darren)([3e13e6a](https://github.com/lacework/terraform-gcp-audit-log/commit/3e13e6af33ab99769e388b95fa4364baed2cd353))
## Documentation Updates
* docs: clean up gcp_project_level example (#44) (Rene Siekermann)([52fe291](https://github.com/lacework/terraform-gcp-audit-log/commit/52fe2916413726674c879099e2dffa6f449377fb))
## Other Changes
* ci: version bump to v2.5.1-dev (Lacework)([525a285](https://github.com/lacework/terraform-gcp-audit-log/commit/525a285abf1f1a3c8e92e9d10331cfb496881859))
---
# v2.5.0

## Features
* feat: adding filtering for k8s logs in GCP Audit Logging (#43) (Mike Laramie)([471e7c0](https://github.com/lacework/terraform-gcp-audit-log/commit/471e7c04197a5d5ca46f2aaccb01b9c19e3ae38e))
## Bug Fixes
* fix(variables): Set labels vars default to empty map rather than null (Ross)([07bab97](https://github.com/lacework/terraform-gcp-audit-log/commit/07bab97f173f1e891e4a9c888a5d8beda04bb98b))
## Other Changes
* chore(examples): Update GCP audit-log module examples (Ross)([e0fb6ab](https://github.com/lacework/terraform-gcp-audit-log/commit/e0fb6abbd87a1190566f9ae208fed8b0cfc27e66))
* ci: version bump to v2.4.1-dev (Lacework)([ef0aacc](https://github.com/lacework/terraform-gcp-audit-log/commit/ef0aacc2a2ced1b5cf3c48a45244d5fbf022d13e))
---
# v2.4.0

## Features
* feat: Add logging block to google_storage_bucket (#40) (Darren)([8143e38](https://github.com/lacework/terraform-gcp-audit-log/commit/8143e386c1abcebebe71a7749b11513ba381d64c))
## Refactor
* refactor: Add prefix and random string to bucket_id argument (#41) (Darren)([6437935](https://github.com/lacework/terraform-gcp-audit-log/commit/64379357e3818167514be845575e38d9795e26c6))
## Other Changes
* ci: version bump to v2.3.1-dev (Lacework)([5398e96](https://github.com/lacework/terraform-gcp-audit-log/commit/5398e964d823d3de6270be1bb26623d4a740acf7))
---
# v2.3.0

## Features
* feat: support for pre-existing Sink  (#38) (Michael Droessler)([db573a8](https://github.com/lacework/terraform-gcp-audit-log/commit/db573a862d25d8d7c8cc57e2dfc4789363b3b1be))
## Documentation Updates
* docs: Add contributing documentation (#37) (Darren)([68ab6a2](https://github.com/lacework/terraform-gcp-audit-log/commit/68ab6a2992169f42832e69dafa41e6487eb684c5))
## Other Changes
* ci: version bump to v2.2.1-dev (Lacework)([ce74bd9](https://github.com/lacework/terraform-gcp-audit-log/commit/ce74bd941d9e5f1cd75d45f169c34992906752dc))
---
# v2.2.0

## Features
* feat: labels for bucket/topic/subscription (#35) (Labesse Kévin)([083886a](https://github.com/lacework/terraform-gcp-audit-log/commit/083886ad495600a863301e3b38dfbe5e977f1b60))
## Other Changes
* ci: version bump to v2.1.1-dev (Lacework)([3cac329](https://github.com/lacework/terraform-gcp-audit-log/commit/3cac329b1158ddfa77d2b23e240a461f227ce92f))
---
# v2.1.0

## Features
* feat: custom bucket region support (#32) (Robert Wedd)([7d822e6](https://github.com/lacework/terraform-gcp-audit-log/commit/7d822e6ce89fef071524bd400dd339a7eb2ecb47))

## Other Changes
* chore: git ignore .terraform.lock.hcl files (#33) (Salim Afiune)([de70307](https://github.com/lacework/terraform-gcp-audit-log/commit/de7030777f7a33241117427dd82367a0c9f82795))
* chore: version bump to v2.0.3-dev (Lacework)([996e128](https://github.com/lacework/terraform-gcp-audit-log/commit/996e128d98da39c00a424fdf74bcf77a2c0711ee))
* ci: sign lacework-releng commits (#30) (Salim Afiune)([f38f50b](https://github.com/lacework/terraform-gcp-audit-log/commit/f38f50b15a36e8c23bd7514890d1cc69fe2a73f3))
---
# v2.0.2

## Bug Fixes
* fix: avoid required lifecycle_rule_age input (Salim Afiune Maya)([9759bfe](https://github.com/lacework/terraform-gcp-audit-log/commit/9759bfe661829934f497cb97cde41c4275cdcb87))
## Other Changes
* chore: format main.tf code (Salim Afiune Maya)([230bc17](https://github.com/lacework/terraform-gcp-audit-log/commit/230bc1732e3df5bcd9b5a1a7ceef8a476c50cc18))
* chore: version bump to v2.0.2-dev (Lacework)([9cb261a](https://github.com/lacework/terraform-gcp-audit-log/commit/9cb261ada36827da1f23d1a612851c251bb36ba2))
---
# v2.0.1

## Bug Fixes
* fix: Add missing organizationViewer role (#26) (Ross)([88e326b](https://github.com/lacework/terraform-gcp-audit-log/commit/88e326bd90a47094338886dd8024d9ca9d83389d))
## Other Changes
* chore: version bump to v2.0.1-dev (Lacework)([9839bea](https://github.com/lacework/terraform-gcp-audit-log/commit/9839bea014db3929366a5773f17455d9d9e6ea0c))
---
# v2.0.0

## Refactor
* refactor: update roles used for audit log storage bucket (#22) (Mike Laramie)([5db1abf](https://github.com/lacework/terraform-gcp-audit-log/commit/5db1abfb4122d84133a22b6400b9ba7c9aa47815))
## Other Changes
* chore: version bump to v1.0.2-dev (Lacework)([9a76f7d](https://github.com/lacework/terraform-gcp-audit-log/commit/9a76f7d8102682f412764320bc3bdc8eabe99a92))
---
# v1.0.1

## Bug Fixes
* fix: support for sensitive values (#20) (mr-menno)([0180ae2](https://github.com/lacework/terraform-gcp-audit-log/commit/0180ae239ff5cb71c2ee5b11d39842ee33d438af))
## Other Changes
* chore: bump required version of TF to 0.12.31 (#23) (Scott Ford)([160cf73](https://github.com/lacework/terraform-gcp-audit-log/commit/160cf730d839cbffb4550f29910110739eb4cd2b))
* chore: version bump to v1.0.1-dev (Lacework)([c0729e0](https://github.com/lacework/terraform-gcp-audit-log/commit/c0729e002f473821a925f08a30471ad8af0b9932))
* ci: fix finding major versions during release (#21) (Salim Afiune)([6ff983f](https://github.com/lacework/terraform-gcp-audit-log/commit/6ff983f794d4f254c5282ad44d40c2495da59dae))
---
# v1.0.0

## Refactor
* refactor: Update the required APIs for audit log integration (#10) (Ross)([910d03f](https://github.com/lacework/terraform-gcp-audit-log/commit/910d03fb5d41dae876231881db2d77e0a994f569))
## Other Changes
* chore: bump version to 1.0.0-dev (Ross Moles)([77dd002](https://github.com/lacework/terraform-gcp-audit-log/commit/77dd0029f39666c982c7663b00b47c41a2af9ef2))
* ci: Switch from CircleCi to Codefresh (#18) (Ross)([4f6f7ec](https://github.com/lacework/terraform-gcp-audit-log/commit/4f6f7ec2a8fb64eab7cc84f83055a5caaefb61fb))
* ci: update release commit message (#17) (Salim Afiune)([7d75f79](https://github.com/lacework/terraform-gcp-audit-log/commit/7d75f7954867e751b69512c219367fbe0e44595a))
* ci: add version bump delay after release (Salim Afiune Maya)([b871a10](https://github.com/lacework/terraform-gcp-audit-log/commit/b871a10bb54007316fd52341a62dd0c87d741ff2))
* ci: add release_contains_features() & check_for_minor_version_bump() (#13) (Ross)([269cc4a](https://github.com/lacework/terraform-gcp-audit-log/commit/269cc4a4ccf714ddbe2f752526b8d94a0b8eba39))
* ci: open release pull request automatically (#12) (Ross)([d1019af](https://github.com/lacework/terraform-gcp-audit-log/commit/d1019af2995d64efadbe73e4b0f4eeb3f69916ce))
* ci: switch releases to be own by Lacework releng ⚡ (#9) (Salim Afiune)([6208d33](https://github.com/lacework/terraform-gcp-audit-log/commit/6208d33dbbcecf86e5b24c266a7b20f84ccf5b12))
---
# v0.1.2

## Bug Fixes
* fix: shorten default service_account_name (#6) (Salim Afiune)([e0c19a0](https://github.com/lacework/terraform-gcp-audit-log/commit/e0c19a08bd83e38180bfc953e5a105783cedc870))
## Documentation Updates
* docs: Update all examples with README files (#7) (Scott Ford)([3ecce12](https://github.com/lacework/terraform-gcp-audit-log/commit/3ecce128b010f41bfc36c07f66b327f03d3c5ab7))
## Other Changes
* ci: send slack notifications to team alias ⭐ (#5) (Salim Afiune)([66eb4ca](https://github.com/lacework/terraform-gcp-audit-log/commit/66eb4ca09eeb90a2aec3d4884b44629309565602))
---
# v0.1.1

## Bug Fixes
* fix: pubsub_subscription_iam_binding to project id (Salim Afiune Maya)([0e9e5d5](https://github.com/lacework/terraform-gcp-audit-log/commit/0e9e5d547dc3057d722160ca71b59c78251672b4))
* fix(gcp): unique suffix added to all new resources (#1) (Alan Nix)([c1e91af](https://github.com/lacework/terraform-gcp-audit-log/commit/c1e91af6e90c3fc8b5c09a0fbc269ecfba3938d5))
## Other Changes
* chore(version): pessimistic constraint for service-account module (#3) (Salim Afiune)([3b14feb](https://github.com/lacework/terraform-gcp-audit-log/commit/3b14febd8ad97bcd3283c317fbd71bbbfa5da90d))
* ci: improve release notes generation (Salim Afiune Maya)([16256c0](https://github.com/lacework/terraform-gcp-audit-log/commit/16256c0dfdd1022f4852608c37c8a461167bc981))
* ci: fix git config commands in release (Salim Afiune Maya)([fff0423](https://github.com/lacework/terraform-gcp-audit-log/commit/fff04239bdf2d8bc219a1b739c33779a5b384a14))
---
# v0.1.0

💡 Initial commit
