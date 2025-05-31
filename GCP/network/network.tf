############################################
# VPC
############################################

resource "google_compute_network" "tf_vpc" {
  project                 = var.project_id
  name                    = var.gcp_vpc.name
  auto_create_subnetworks = false
}

############################################
# SUBNET PRIVATE
############################################

resource "google_compute_subnetwork" "tf_sb_private" {
  project       = var.project_id
  name          = var.gcp_sb_private.name
  ip_cidr_range = var.gcp_sb_private.ip
  region        = var.gcp_project.region
  network       = google_compute_network.tf_vpc.id
}

############################################
# SUBNET PUBLIC
############################################

resource "google_compute_subnetwork" "tf_sb_public" {
  project       = var.project_id
  name          = var.gcp_sb_public.name
  ip_cidr_range = var.gcp_sb_public.ip
  region        = var.gcp_project.region
  network       = google_compute_network.tf_vpc.id
}