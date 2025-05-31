############################################
# OUTPUT
############################################

output "filestore" {
  value = module.gcp_filestore.filestore_ip
}

output "firestore" {
  value = module.gcp_firestore.firestore_id
}

output "gke" {
  value = module.gcp_gke.gke_ip
}

output "linux" {
  value = module.gcp_compute.linux_ip
}

output "sql" {
  value = module.gcp_sql.sql_ip
}

output "storage" {
  value = module.gcp_storage.storage_url
}

output "vpn" {
  value = module.gcp_vpn.vpn_ip
}

#output "windows" {
#  value = module.gcp_compute.windows_ip
#}