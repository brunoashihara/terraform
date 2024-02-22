############################################
# STORAGE
############################################

resource "google_storage_bucket" "teste_storage" {
  name          = var.stg.name
  location      = var.stg.location
  storage_class = var.stg.class
  force_destroy = true
}

############################################
# STORAGE PERMISSIONS
############################################

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.teste_storage.name
  role   = var.stg.role
  member = var.stg.entity
}