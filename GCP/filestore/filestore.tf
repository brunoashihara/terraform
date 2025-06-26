############################################
# FILESTORE
############################################

resource "google_filestore_instance" "tf_filestore" {
  project = var.project_id
  name    = var.gcp_filestore.name
  tier    = var.gcp_filestore.tier
  file_shares {
    capacity_gb = var.gcp_filestore.cap
    name        = var.gcp_filestore.share
  }
  networks {
    network           = var.vpc_id
    modes             = [var.gcp_filestore.network]
    reserved_ip_range = var.gcp_filestore.ip_range
  }
}