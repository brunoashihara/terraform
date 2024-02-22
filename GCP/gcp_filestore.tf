############################################
# FILESTORE
############################################

resource "google_filestore_instance" "teste_filestore" {
  name = var.filestore.name
  tier = var.filestore.tier
  file_shares {
    capacity_gb = var.filestore.cap
    name        = var.filestore.share
  }
  networks {
    network = google_compute_network.teste_vpc.id
    modes   = [var.filestore.network]
  }
  depends_on = [
    google_project_service.teste_filestore_enable
  ]
}