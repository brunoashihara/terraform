############################################
# STORAGE
############################################

resource "google_storage_bucket" "tf_storage" {
  project       = var.project_id
  name          = var.gcp_storage.name
  location      = var.gcp_storage.location
  storage_class = var.gcp_storage.class
  force_destroy = true
}

############################################
# STORAGE PERMISSIONS
############################################

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.tf_storage.name
  role   = var.gcp_storage.role
  member = var.gcp_storage.entity
}