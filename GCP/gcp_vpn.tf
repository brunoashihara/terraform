############################################
# VPN GATEWAY
############################################

resource "google_compute_vpn_gateway" "teste_vpn_gw" {
  name    = var.vpn.gw
  network = google_compute_network.teste_vpc.id
}

############################################
# VPN IP
############################################

resource "google_compute_address" "teste_vpn_ip" {
  depends_on = [
    google_project_service.teste_compute_enable
  ]
  name = var.vpn.ip
}

############################################
# VPN FORWARDING ESP
############################################

resource "google_compute_forwarding_rule" "teste_fr_esp" {
  name        = var.vpn_fr.esp_name
  ip_protocol = var.vpn_fr.esp_prot
  ip_address  = google_compute_address.teste_vpn_ip.address
  target      = google_compute_vpn_gateway.teste_vpn_gw.id
}

############################################
# VPN FORWARDING 500
############################################

resource "google_compute_forwarding_rule" "teste_fr_udp500" {
  name        = var.vpn_fr.500_name
  ip_protocol = var.vpn_fr.500_prot
  port_range  = var.vpn_fr.500_port
  ip_address  = google_compute_address.teste_vpn_ip.address
  target      = google_compute_vpn_gateway.teste_vpn_gw.id
}

############################################
# VPN FORWARDING 4500
############################################

resource "google_compute_forwarding_rule" "teste_fr_udp4500" {
  name        = var.vpn_fr.4500_name
  ip_protocol = var.vpn_fr.4500_prot
  port_range  = var.vpn_fr.4500_port
  ip_address  = google_compute_address.teste_vpn_ip.address
  target      = google_compute_vpn_gateway.teste_vpn_gw.id
}

############################################
# VPN TUNNEL
############################################

resource "google_compute_vpn_tunnel" "teste_tunnel" {
  name                    = var.vpn.tunnel
  peer_ip                 = var.vpn.onprem
  local_traffic_selector  = [var.project.coringa]
  remote_traffic_selector = [var.project.coringa]
  shared_secret           = var.vpn.key
  target_vpn_gateway      = google_compute_vpn_gateway.teste_vpn_gw.id
  depends_on = [
    google_compute_forwarding_rule.teste_fr_esp,
    google_compute_forwarding_rule.teste_fr_udp500,
    google_compute_forwarding_rule.teste_fr_udp4500,
  ]
}

############################################
# VPN ROUTE TABLE
############################################

resource "google_compute_route" "teste_vpn_rt" {
  name                = var.vpn.rt_name
  network             = google_compute_network.teste_vpc.name
  dest_range          = var.vpn.onprem_sb
  priority            = var.vpn_rt_prio
  next_hop_vpn_tunnel = google_compute_vpn_tunnel.teste_tunnel.id
}