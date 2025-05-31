############################################
# COMPARTMENT
############################################

resource "oci_identity_compartment" "compartment" {
  description   = var.oci_compartment.desc
  name          = var.oci_compartment.name
  enable_delete = var.oci_compartment.delete
}