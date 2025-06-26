############################################
# STORAGE
############################################

#tfsec:ignore:google-storage-bucket-encryption-customer-key
resource "google_storage_bucket" "tf_storage" {
  project                     = var.project_id
  name                        = var.gcp_storage.name
  location                    = var.gcp_storage.location
  storage_class               = var.gcp_storage.class
  force_destroy               = true
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket        = google_storage_bucket.tf_storage.name
    log_object_prefix = "logs/"
  }
  public_access_prevention = "enforced"
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age            = 1
      matches_prefix = ["logs/"]
    }
  }
}