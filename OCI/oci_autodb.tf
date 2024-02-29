############################################
# AUTONOMOUS DATABASE
############################################

resource "oci_database_autonomous_database" "autodb" {
  compartment_id                  = oci_identity_compartment.compartment.id
  db_name                         = var.autodb.db_name
  admin_password                  = var.autodb.pass
  db_version                      = var.autodb.version
  display_name                    = var.autodb.name
  is_free_tier                    = var.autodb.free
}