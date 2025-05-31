############################################
# OUTPUT
############################################

output "blob_endpoint" {
  value = azurerm_storage_account.tf_sa.primary_blob_endpoint
}