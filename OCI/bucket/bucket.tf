############################################
# BUCKET
############################################

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment_id
  name           = var.oci_bucket.name
  namespace      = var.oci_bucket.namespace
  access_type    = var.oci_bucket.type
  storage_tier   = var.oci_bucket.tier
}