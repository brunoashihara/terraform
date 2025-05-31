############################################
# Customer Premises Equipament
############################################

resource "oci_core_cpe" "tf_cpe" {
  compartment_id = var.compartment_id
  ip_address     = var.oci_cpe.ip
  display_name   = var.oci_cpe.name
}

############################################
# Dynamic Routing Gateway
############################################

resource "oci_core_drg" "tf_drg" {
  compartment_id = var.compartment_id
  display_name   = var.oci_drg.name
}

############################################
# Dynamic Routing Gateway Attachment
############################################

resource "oci_core_drg_attachment" "tf_drg_attach" {
  drg_id       = oci_core_drg.tf_drg.id
  display_name = var.oci_drg_attach.name
  network_details {
    id   = var.vcn_id
    type = var.oci_drg_attach.type
  }
}

############################################
# IPSec
############################################

resource "oci_core_ipsec" "tf_ipsec" {
  compartment_id            = var.compartment_id
  cpe_id                    = oci_core_cpe.tf_cpe.id
  drg_id                    = oci_core_drg.tf_drg.id
  static_routes             = var.oci_ipsec.static
  cpe_local_identifier      = var.oci_ipsec.cpe
  cpe_local_identifier_type = var.oci_ipsec.ident_type
  display_name              = var.oci_ipsec.name
}