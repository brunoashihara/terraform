############################################
# Customer Premises Equipament
############################################

resource "oci_core_cpe" "cpe" {
  compartment_id = oci_identity_compartment.compartment.id
  ip_address     = var.cpe.ip
  display_name   = var.cpe.name
}

############################################
# Dynamic Routing Gateway
############################################

resource "oci_core_drg" "drg" {
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = var.drg.name
}

############################################
# Dynamic Routing Gateway Attachment
############################################

resource "oci_core_drg_attachment" "drg_attach" {
  drg_id             = oci_core_drg.drg.id
  display_name       = var.drg_attach.name
  drg_route_table_id = oci_core_drg_route_table.drg_rt.id
  network_details {
    id   = oci_core_vcn.vcn.id
    type = var.drg_attach.type
  }
#  route_table_id = oci_core_route_table.rt.id
}

############################################
# Dynamic Routing Gateway Route Table
############################################

resource "oci_core_drg_route_table" "drg_rt" {
  drg_id          = oci_core_drg.drg.id
  display_name    = var.drg_rt.name
  is_ecmp_enabled = var.drg_rt.ecmp
}

############################################
# Dynamic Routing Gateway Route Table Rule
############################################

resource "oci_core_drg_route_table_route_rule" "drg_rt_rule" {
  drg_route_table_id         = oci_core_drg_route_table.drg_rt.id
  destination                = var.drg_rt_rule.dest
  destination_type           = var.drg_rt_rule.type
  next_hop_drg_attachment_id = oci_core_drg_attachment.drg_attach.id
}

############################################
# IPSec
############################################

resource "oci_core_ipsec" "ipsec" {
  compartment_id            = oci_identity_compartment.compartment.id
  cpe_id                    = oci_core_cpe.cpe.id
  drg_id                    = oci_core_drg.drg.id
  static_routes             = var.ipsec.static
  cpe_local_identifier      = var.ipsec.cpe
  cpe_local_identifier_type = var.ipsec.ident_type
  display_name              = var.ipsec.name
}

############################################
# IPSec Tunnel
############################################

#resource "oci_core_ipsec_connection_tunnel_management" "test_ip_sec_connection_tunnel" {
#  ipsec_id     = oci_core_ipsec.ipsec.id
#  tunnel_id    = data.oci_core_ipsec_connection_tunnels.test_ip_sec_connection_tunnels.ip_sec_connection_tunnels[0].id
#  routing      = var.ipsec_tunnel.routing
#  display_name = var.ipsec_tunnel.name
#  encryption_domain_config {
#    cpe_traffic_selector    = var.ipsec_tunnel.dest
#    oracle_traffic_selector = var.ipsec_tunnel.cidr
#  }
#  shared_secret       = var.ipsec_tunnel.secret
#  ike_version         = var.ipsec_tunnel.ike
#  oracle_can_initiate = var.ipsec_tunnel.initiate
#  phase_one_details {
#    custom_authentication_algorithm = var.ipsec_tunnel.algo1
#    custom_dh_group                 = var.ipsec_tunnel.dh1
#    custom_encryption_algorithm     = var.ipsec_tunnel.encrypt1
#    is_custom_phase_one_config      = var.ipsec_tunnel.config1
#    lifetime                        = var.ipsec_tunnel.lifetime1
#  }
#  phase_two_details {
#    custom_authentication_algorithm = var.ipsec_tunnel.algo2
#    custom_dh_group                 = var.ipsec_tunnel.dh2
#    custom_encryption_algorithm     = var.ipsec_tunnel.encrypt2
#    is_custom_phase_two_config      = var.ipsec_tunnel.config2
#    lifetime                        = var.ipsec_tunnel.lifetime2
#  }
#}