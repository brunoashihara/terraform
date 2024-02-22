############################################
# OUTPUT
############################################

output "blob_endpoint" {
  value = azurerm_storage_account.teste_sa.primary_blob_endpoint
}

output "container_ip" {
  value = azurerm_container_group.teste_ctn.ip_address
}

output "cosmodb_endpoint" {
  value = azurerm_cosmosdb_account.teste_cosmodb.endpoint
}

output "mssql_dn" {
  value = azurerm_mssql_server.teste_mssql.fully_qualified_domain_name
}

output "mysql_dn" {
  value = azurerm_mysql_server.teste_mysql.fqdn
}

output "postgres_dn" {
  value = azurerm_postgresql_server.teste_postgres.fqdn
}

output "share_url" {
  value = azurerm_storage_share.teste_share.url
}

output "linux_ip" {
  value = azurerm_public_ip.teste_ip_linux.ip_address
}

output "windows_ip" {
  value = azurerm_public_ip.teste_ip_windows.ip_address
}

output "vpn_ip" {
  value = azurerm_public_ip.teste_vpn.ip_address
}