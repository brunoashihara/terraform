############################################
# OUTPUT
############################################

output "cosmodb_endpoint" {
  value = azurerm_cosmosdb_account.tf_cosmodb.endpoint
}