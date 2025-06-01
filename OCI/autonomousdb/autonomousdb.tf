############################################
# AUTONOMOUS DATABASE
############################################

resource "oci_database_autonomous_database" "autodb" {
  compartment_id                  = var.compartment_id
  db_name                         = var.oci_autonomousdb.db_name
  admin_password                  = var.oci_autonomousdb.pass
  db_version                      = var.oci_autonomousdb.version
  display_name                    = var.oci_autonomousdb.name
  is_free_tier                    = var.oci_autonomousdb.free
}