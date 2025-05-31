############################################
# K8e
############################################

resource "google_container_cluster" "tf_gke" {
  project             = var.project_id
  name                = var.gcp_gke.name
  location            = var.gcp_project.region
  initial_node_count  = var.gcp_gke.count
  ip_allocation_policy {
  }
  enable_autopilot = true
  node_config {
    oauth_scopes = [
      var.gcp_gke.oauth
    ]
    labels = {
      environment = "training"
    }
    tags = var.gcp_gke.tags
  }
  timeouts {
    create = var.gcp_gke.to_create
    update = var.gcp_gke.to_update
  }
#  network    = var.vpc_id
#  subnetwork = var.sb_public_id
}