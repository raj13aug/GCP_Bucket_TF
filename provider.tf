provider "google" {
  credentials = file("~/gcp/access-keys.json")
  project     = var.project_id
}