############################################
# VCN
############################################
resource "oci_core_vcn" "vcn" {
  compartment_id = oci_identity_compartment.compartment.id
  cidr_blocks    = var.vcn.cidr
  display_name   = var.vcn.name
}

############################################
# SUBNET PUBLIC
############################################

resource "oci_core_subnet" "sb_public" {
  compartment_id             = oci_identity_compartment.compartment.id
  vcn_id                     = oci_core_vcn.vcn.id
  cidr_block                 = var.sb_public.cidr
  display_name               = var.sb_public.name
  prohibit_public_ip_on_vnic = !var.sb_public.public
  prohibit_internet_ingress  = !var.sb_public.public
}

############################################
# INTERNET GATEWAY
############################################

resource "oci_core_internet_gateway" "igw" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.igw.name
}

############################################
# ROUTE TABLE
############################################

resource "oci_core_route_table" "rt" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.rt_public.name
  route_rules {
    destination       = var.rt_public.cidr1
    description       = var.rt_public.desc1
    network_entity_id = oci_core_internet_gateway.igw.id
  }
  route_rules {
    destination       = var.rt_public.cidr2
    description       = var.rt_public.desc2
    network_entity_id = oci_core_drg.drg.id
  }

}

############################################
# ROUTE TABLE ATTACH
############################################

resource "oci_core_route_table_attachment" "rt_attach" {
  subnet_id      = oci_core_subnet.sb_public.id
  route_table_id = oci_core_route_table.rt.id
}

############################################
# NETWORK SECURITY GROUP
############################################

resource "oci_core_network_security_group" "nsg" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = var.nsg_public.name
}

############################################
# NETWORK SECURITY GROUP RULE INGRESS
############################################

resource "oci_core_network_security_group_security_rule" "ngs-ingress" {
  network_security_group_id = oci_core_network_security_group.nsg.id
  direction                 = var.nsg_public.ingress
  protocol                  = var.nsg_public.proto_all
  source_type               = var.nsg_public.type
  source                    = var.nsg_public.cidr_all
}

############################################
# NETWORK SECURITY GROUP RULE EGRESS
############################################

resource "oci_core_network_security_group_security_rule" "ngs-egress" {
  network_security_group_id = oci_core_network_security_group.nsg.id
  direction                 = var.nsg_public.egress
  protocol                  = var.nsg_public.proto_all
  destination_type          = var.nsg_public.type
  destination               = var.nsg_public.cidr_all
}
