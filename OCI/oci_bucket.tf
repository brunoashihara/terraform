############################################
# BUCKET
############################################

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = oci_identity_compartment.compartment.id
  name           = var.bucket.name
  namespace      = var.bucket.namespace
  access_type    = var.bucket.type
  storage_tier   = var.bucket.tier
}