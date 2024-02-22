############################################
# AUTONOMOUS DATABASE
############################################

resource "oci_database_autonomous_database" "autodb" {
  compartment_id = oci_identity_compartment.compartment.id
  db_name        = var.autodb.db_name
  admin_password = var.autodb.pass
  db_version     = var.autodb.version
  display_name   = var.autodb.name
  is_free_tier   = var.autodb.free
}

############################################
# AUTONOMOUS DATABASE BACKUP
############################################

resource "oci_database_autonomous_database_backup" "autodb_backup" {
  autonomous_database_id   = oci_database_autonomous_database.autodb.id
  display_name             = var.autodb_backup.name
  is_long_term_backup      = var.autodb_backup.long_term
  retention_period_in_days = var.autodb_backup.retention
}