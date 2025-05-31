############################################
# NETWORK SECURITY GROUP PRIVATE
############################################

resource "oci_core_network_security_group" "tf_nsg_private" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.oci_nsg_private.name
}

############################################
# NETWORK SECURITY GROUP PUBLIC
############################################

resource "oci_core_network_security_group" "tf_nsg_public" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.oci_nsg_public.name
}

############################################
# NETWORK SECURITY GROUP RULE INGRESS PRIVATE
############################################

resource "oci_core_network_security_group_security_rule" "nsg_private_ingress" {
  for_each = { for idx, rule in var.oci_nsg_private.ingress_rules : idx => rule }

  network_security_group_id = oci_core_network_security_group.nsg_private.id
  direction                 = "INGRESS"
  protocol                  = each.value.protocol
  source_type               = each.value.source_type
  source                    = each.value.source
  description               = lookup(each.value, "description", null)
  stateless                 = lookup(each.value, "stateless", false)
}

############################################
# NETWORK SECURITY GROUP RULE INGRESS PUBLIC
############################################

resource "oci_core_network_security_group_security_rule" "nsg_public_ingress" {
  for_each = { for idx, rule in var.oci_nsg_public.ingress_rules : idx => rule }
  network_security_group_id = oci_core_network_security_group.tf_nsg_public.id
  direction                 = "INGRESS"
  protocol                  = each.value.protocol
  source_type               = each.value.source_type
  source                    = each.value.source
  description               = lookup(each.value, "description", null)
  stateless                 = lookup(each.value, "stateless", false)
}

############################################
# NETWORK SECURITY GROUP RULE EGRESS PRIVATE
############################################

resource "oci_core_network_security_group_security_rule" "nsg_private_egress" {
  for_each = { for idx, rule in var.oci_nsg_private.egress_rules : idx => rule }

  network_security_group_id = oci_core_network_security_group.nsg_private.id
  direction                 = "EGRESS"
  protocol                  = each.value.protocol
  destination_type          = each.value.destination_type
  destination               = each.value.destination
  description               = lookup(each.value, "description", null)
  stateless                 = lookup(each.value, "stateless", false)
}

############################################
# NETWORK SECURITY GROUP RULE EGRESS PUBLIC
############################################

resource "oci_core_network_security_group_security_rule" "nsg_public_egress" {
  for_each = { for idx, rule in var.oci_nsg_public.egress_rules : idx => rule }

  network_security_group_id = oci_core_network_security_group.nsg_public.id
  direction                 = "EGRESS"
  protocol                  = each.value.protocol
  destination_type          = each.value.destination_type
  destination               = each.value.destination
  description               = lookup(each.value, "description", null)
  stateless                 = lookup(each.value, "stateless", false)
}