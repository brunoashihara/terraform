############################################
# VPN GATEWAY
############################################

resource "google_compute_vpn_gateway" "tf_vpn_gw" {
  project = var.project_id
  name    = var.gcp_vpn.gw
  network = var.vpc_id
}

############################################
# VPN IP
############################################

resource "google_compute_address" "tf_vpn_ip" {
  project = var.project_id
  name    = var.gcp_vpn.ip
}

############################################
# VPN FORWARDING ESP
############################################

resource "google_compute_forwarding_rule" "tf_fr_esp" {
  project     = var.project_id
  name        = var.gcp_vpn_fr.esp_name
  ip_protocol = var.gcp_vpn_fr.esp_prot
  ip_address  = google_compute_address.tf_vpn_ip.address
  target      = google_compute_vpn_gateway.tf_vpn_gw.id
}

############################################
# VPN FORWARDING 500
############################################

resource "google_compute_forwarding_rule" "tf_fr_udp500" {
  project     = var.project_id
  name        = var.gcp_vpn_fr.name_500
  ip_protocol = var.gcp_vpn_fr.prot_500
  port_range  = var.gcp_vpn_fr.port_500
  ip_address  = google_compute_address.tf_vpn_ip.address
  target      = google_compute_vpn_gateway.tf_vpn_gw.id
}

############################################
# VPN FORWARDING 4500
############################################

resource "google_compute_forwarding_rule" "tf_fr_udp4500" {
  project     = var.project_id
  name        = var.gcp_vpn_fr.name_4500
  ip_protocol = var.gcp_vpn_fr.prot_4500
  port_range  = var.gcp_vpn_fr.port_4500
  ip_address  = google_compute_address.tf_vpn_ip.address
  target      = google_compute_vpn_gateway.tf_vpn_gw.id
}

############################################
# VPN TUNNEL
############################################

resource "google_compute_vpn_tunnel" "tf_tunnel" {
  project                 = var.project_id
  name                    = var.gcp_vpn.tunnel
  peer_ip                 = var.gcp_vpn.onprem
  local_traffic_selector  = [var.gcp_vpn.local]
  remote_traffic_selector = [var.gcp_vpn.remote]
  shared_secret           = var.gcp_vpn.key
  target_vpn_gateway      = google_compute_vpn_gateway.tf_vpn_gw.id
  depends_on = [
    google_compute_forwarding_rule.tf_fr_esp,
    google_compute_forwarding_rule.tf_fr_udp500,
    google_compute_forwarding_rule.tf_fr_udp4500,
  ]
}

############################################
# VPN ROUTE TABLE
############################################

resource "google_compute_route" "tf_vpn_rt" {
  project             = var.project_id
  name                = var.gcp_vpn.rt_name
  network             = var.gcp_vpc.name
  dest_range          = var.gcp_vpn.onprem_sb
  priority            = var.gcp_vpn.rt_prio
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.tf_tunnel.id
}