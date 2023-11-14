resource "google_storage_bucket" "source" {
  name          = var.bucket_name_source
  storage_class = var.storage_class
  location      = var.bucket_location
  force_destroy = true
}


resource "null_resource" "upload_folder_content" {
  triggers = {
    file_hashes = jsonencode({
      for fn in fileset(var.folder_path, "*.jpg") :
      fn => filesha256("${var.folder_path}/${fn}")
    })
  }

  provisioner "local-exec" {
    command = "gsutil cp -r ${var.folder_path}/* gs://${var.bucket_name_source}/"
  }
}