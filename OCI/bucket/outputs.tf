############################################
# OUTPUT
############################################

output "bucket_name" {
  value = oci_objectstorage_bucket.tf_bucket.name
}