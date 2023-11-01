resource "google_storage_bucket" "source" {
  name          = var.bucket_name_source
  storage_class = var.storage_class
  location      = var.bucket_location
}


resource "google_storage_bucket" "destination" {
  name          = var.bucket_name_destination
  storage_class = var.storage_class
  location      = var.bucket_location
}