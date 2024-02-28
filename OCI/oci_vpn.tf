############################################
# Customer Premises Equipament
############################################

resource "oci_core_cpe" "cpe" {
    compartment_id  = oci_identity_compartment.compartment.id
    ip_address      = var.cpe.ip
    display_name    = var.cpe.name
}

############################################
# Dynamic Routing Gateway
############################################

resource "oci_core_drg" "drg" {
    compartment_id = oci_identity_compartment.compartment.id
    display_name = var.drg.name
}

############################################
# Dynamic Routing Gateway Attachment
############################################

resource "oci_core_drg_attachment" "drg_attach" {
    drg_id = oci_core_drg.drg.id
    display_name = var.drg_attach.name
    drg_route_table_id = oci_core_drg_route_table.drg_rt.id
    network_details {
        id = oci_core_vcn.vcn.id
        type = var.drg_attach.type
    }
    route_table_id  = oci_core_route_table.rt.id
}

############################################
# Dynamic Routing Gateway Route Table
############################################

resource "oci_core_drg_route_table" "drg_rt" {
    drg_id = oci_core_drg.drg.id
    display_name = var.drg_rt.name
    is_ecmp_enabled = var.drg_rt.ecmp
}

############################################
# Dynamic Routing Gateway Route Table Rule
############################################

resource "oci_core_drg_route_table_route_rule" "drg_rt_rule" {
    drg_route_table_id = oci_core_drg_route_table.drg_rt.id
    destination = var.drg_rt_rule.dest
    destination_type = var.drg_rt_rule.type
    next_hop_drg_attachment_id = oci_core_drg_attachment.drg_attach.id

}