############################################
# OUTPUT
############################################

output "mssql_dn" {
  value = azurerm_mssql_server.tf_mssql.fully_qualified_domain_name
}

output "mysql_dn" {
  value = azurerm_mysql_server.tf_mysql.fqdn
}

output "postgres_dn" {
  value = azurerm_postgresql_server.tf_postgres.fqdn
}