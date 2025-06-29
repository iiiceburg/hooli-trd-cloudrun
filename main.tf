locals {
  project_id   = "tridorian-lab"
  location     = "asia-southeast1" # or "us-central1", etc.
  abbrv_region = "sg"
  environment  = "prd" # or "staging", etc.
  prefix       = "${local.project_id}-${local.environment}-${local.abbrv_region}"
}
