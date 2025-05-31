############################################
# OUTPUT
############################################

output "storage_account_id" {
  value = azurerm_storage_account.tf_sa.id
}

output "storage_account_key" {
  value = azurerm_storage_account.tf_sa.primary_access_key
}

output "storage_account_name" {
  value = azurerm_storage_account.tf_sa.name
}

