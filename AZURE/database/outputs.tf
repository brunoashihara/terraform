############################################
# OUTPUT
############################################

output "mssql_dn" {
  value = azurerm_mssql_server.tf_mssql.fully_qualified_domain_name
}