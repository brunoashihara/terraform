############################################
# VPC
############################################

resource "google_compute_network" "teste_vpc" {
  depends_on = [
    google_project_service.teste_compute_enable
  ]
  name                    = var.vpc.name
  auto_create_subnetworks = false
}

############################################
# SUBNET PUBLIC
############################################

resource "google_compute_subnetwork" "teste_sb_public" {
  name          = var.sb_public.name
  ip_cidr_range = var.sb_public.ip
  region        = var.project.region
  network       = google_compute_network.teste_vpc.id
}

############################################
# FIREWALL PUBLIC
############################################

resource "google_compute_firewall" "teste_fw_public" {
  name    = var.fw_public.name
  network = google_compute_network.teste_vpc.id
  allow {
    protocol = var.fw_public.icmp
  }
  allow {
    protocol = var.fw_public.tcp
    ports    = [var.fw_public.http]
  }
  allow {
    protocol = var.fw_public.tcp
    ports    = [var.fw_public.ssh]
  }
  allow {
    protocol = var.fw_public.tcp
    ports    = [var.fw_public.rdp]
  }
  allow {
    protocol = var.fw_public.tcp
    ports    = [var.fw_public.nfs]
  }
  source_ranges = [var.project.coringa]
}