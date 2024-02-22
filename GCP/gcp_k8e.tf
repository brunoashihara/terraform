############################################
# K8e
############################################

resource "google_container_cluster" "teste_k8e" {
  depends_on = [
    google_project_service.teste_k8e_enable
  ]
  name               = var.k8e.name
  location           = var.project.region
  initial_node_count = var.k8e.count
  ip_allocation_policy {
  }
  enable_autopilot = true
  node_config {
    oauth_scopes = [
      var.k8e.oauth
    ]
    labels = {
      environment = "training"
    }
    tags = var.k8e.tags
  }
  timeouts {
    create = var.k8e.to_create
    update = var.k8e.to_update
  }
#  network    = google_compute_network.teste_vpc.id
#  subnetwork = google_compute_subnetwork.teste_sb_public.id
}