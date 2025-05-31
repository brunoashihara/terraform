############################################
# VCN
############################################
resource "oci_core_vcn" "tf_vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = var.oci_vcn.cidr
  display_name   = var.oci_vcn.name
}

############################################
# SUBNET PRIVATE
############################################

resource "oci_core_subnet" "tf_sb_private" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.tf_vcn.id
  cidr_block                 = var.oci_sb_private.cidr
  display_name               = var.oci_sb_private.name
  prohibit_public_ip_on_vnic = !var.oci_sb_private.public
  prohibit_internet_ingress  = !var.oci_sb_private.public
  dns_label                  = var.oci_sb_private.label
}


############################################
# SUBNET PUBLIC
############################################

resource "oci_core_subnet" "tf_sb_public" {
  compartment_id             = var.compartment_id
  vcn_id                     = oci_core_vcn.tf_vcn.id
  cidr_block                 = var.oci_sb_public.cidr
  display_name               = var.oci_sb_public.name
  prohibit_public_ip_on_vnic = !var.oci_sb_public.public
  prohibit_internet_ingress  = !var.oci_sb_public.public
}

############################################
# INTERNET GATEWAY
############################################

resource "oci_core_internet_gateway" "tf_igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.tf_vcn.id
  display_name   = var.oci_igw.name
}