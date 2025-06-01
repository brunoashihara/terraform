############################################
# OUTPUT
############################################

output "storage_name" {
  value = google_storage_bucket.tf_storage.name
}

output "storage_url" {
  value = google_storage_bucket.tf_storage.url
}