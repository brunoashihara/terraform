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
  drg_id       = oci_core_drg.drg.id
  display_name = var.drg_attach.name
  network_details {
    id   = oci_core_vcn.vcn.id
    type = var.drg_attach.type
  }
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