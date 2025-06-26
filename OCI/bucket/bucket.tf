############################################
# BUCKET
############################################

resource "oci_objectstorage_bucket" "tf_bucket" {
  # checkov:skip=CKV_OCI_9: Customer Managed Key (CMK) not needed for this test bucket
  # checkov:skip=CKV_OCI_7: Event emission not required for test bucket
  compartment_id = var.compartment_id
  name           = var.oci_bucket.name
  namespace      = var.oci_bucket.namespace
  access_type    = var.oci_bucket.type
  storage_tier   = var.oci_bucket.tier
  versioning     = var.oci_bucket.version
}

############################################
# BUCKET LIFECYCLE
############################################

resource "oci_objectstorage_object_lifecycle_policy" "tf_bucket_lifecycle" {
  namespace = var.oci_bucket.namespace
  bucket    = oci_objectstorage_bucket.tf_bucket.name

  rules {
    name        = var.oci_bucket.lifecycle_name
    action      = var.oci_bucket.lifecycle_action
    target      = var.oci_bucket.lifecycle_target
    is_enabled  = true
    time_amount = var.oci_bucket.lifecycle_time
    time_unit   = var.oci_bucket.lifecycle_unit
  }
}