############################################
# OUTPUT
############################################

output "blob" {
  value = module.azure_storage.blob_endpoint
}

output "container" {
  value = module.azure_container.container_ip
}

output "cosmodb" {
  value = module.azure_cosmodb.cosmodb_endpoint
}

output "fileshare" {
  value = module.azure_fileshare.fileshare_url
}

output "linux" {
  value = module.azure_network.linux_ip
}

output "mssql" {
  value = module.azure_database.mssql_dn
}

output "mysql" {
  value = module.azure_database.mysql_dn
}

output "postgres" {
  value = module.azure_database.postgres_dn
}

output "vpn" {
  value = module.azure_vpn.vpn_ip
}

output "windows" {
  value = module.azure_network.windows_ip
}