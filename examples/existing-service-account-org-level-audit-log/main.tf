provider "google" {}

provider "lacework" {}

module "gcp_organization_level_audit_log" {
  source = "../../"

  use_existing_service_account = true
  service_account_name         = "my-service-account"
  service_account_private_key  = "ewogICJwcm9qZWN0X2lkIjogInNlY3JldCIsCiAgInByaXZhdGVfa2V5X2lkIjogIkdvdCB5YSEiLAogICJwcml2YXRlX2tleSI6ICJZb3Ugc2hvdWxkbid0IGJlIHJlYWRpbmcgdGhpcyBpbmZvcm1hdGlvbiA6LSkiLAogICJjbGllbnRfZW1haWwiOiAibm90QHZlcnkubmljZSIsCiAgImNsaWVudF9pZCI6ICIxMjM0Igp9Cg=="
  org_integration              = true
  organization_id              = "my-organization-id"
}
