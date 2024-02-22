############################################
# OUTPUT
############################################

output "linux_ip" {
  value = google_compute_address.teste_linux_ip.address
}

#output "windows_ip" {
#  value = google_compute_address.teste_windows_ip.address
#}

output "filestore_ip" {
  value = google_filestore_instance.teste_filestore.networks.0.ip_addresses.0
}

output "firestore_id" {
  value = google_firestore_database.teste_firestore.id
}

output "k8e_ip" {
  value = google_container_cluster.teste_k8e.endpoint
}

output "sql_ip" {
  value = google_sql_database_instance.teste_db_instance.public_ip_address
}

output "storage_url" {
  value = google_storage_bucket.teste_storage.url
}

output "vpn_ip" {
  value = google_compute_address.teste_vpn_ip.address
}