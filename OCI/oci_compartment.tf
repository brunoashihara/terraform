############################################
# COMPARTMENT
############################################

resource "oci_identity_compartment" "compartment" {
  description   = var.compartment.desc
  name          = var.compartment.name
  enable_delete = var.compartment.delete
}
