############################################
# OUTPUT
############################################

output "filestore_ip" {
  value = google_filestore_instance.tf_filestore.networks[0].ip_addresses[0]
}