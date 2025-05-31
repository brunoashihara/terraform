############################################
# ROUTE TABLE PRIVATE
############################################

resource "oci_core_route_table" "tf_rt_private" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.oci_rt_private.name
}

############################################
# ROUTE TABLE PUBLIC
############################################

resource "oci_core_route_table" "tf_rt_public" {
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id
  display_name   = var.oci_rt_public.name

  dynamic "route_rules" {
    for_each = var.oci_rt_public.rules
    content {
      destination       = route_rules.value.cidr
      description       = route_rules.value.description
      network_entity_id = route_rules.value.target_id
    }
  }
}

############################################
# ROUTE TABLE ATTACH PRIVATE
############################################

resource "oci_core_route_table_attachment" "tf_rt_attach_private" {
  subnet_id      = var.sb_private_id
  route_table_id = oci_core_route_table.tf_rt_private.id
}


############################################
# ROUTE TABLE ATTACH PUBLIC
############################################

resource "oci_core_route_table_attachment" "tf_rt_attach_public" {
  subnet_id      = var.sb_public_id
  route_table_id = oci_core_route_table.tf_rt_public.id
}