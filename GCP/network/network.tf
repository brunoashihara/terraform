############################################
# VPC
############################################

resource "google_compute_network" "tf_vpc" {
  #checkov:skip=CKV2_GCP_18:firewall is handled by separate module
  project                 = var.project_id
  name                    = var.gcp_vpc.name
  auto_create_subnetworks = false
}

############################################
# SUBNET PRIVATE
############################################

#tfsec:ignore:google-compute-enable-vpc-flow-logs
resource "google_compute_subnetwork" "tf_sb_private" {
  #checkov:skip=CKV_GCP_26:This subnet doesnt need to enable flow logs
  project                  = var.project_id
  name                     = var.gcp_sb_private.name
  ip_cidr_range            = var.gcp_sb_private.ip
  region                   = var.gcp_project.region
  network                  = google_compute_network.tf_vpc.id
  private_ip_google_access = true
}

############################################
# SUBNET PUBLIC
############################################

#tfsec:ignore:google-compute-enable-vpc-flow-logs
resource "google_compute_subnetwork" "tf_sb_public" {
  #checkov:skip=CKV_GCP_26:This subnet doesnt need to enable flow logs
  project                  = var.project_id
  name                     = var.gcp_sb_public.name
  ip_cidr_range            = var.gcp_sb_public.ip
  region                   = var.gcp_project.region
  network                  = google_compute_network.tf_vpc.id
  private_ip_google_access = true
}