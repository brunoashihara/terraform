############################################
# BLOB
############################################

resource "azurerm_storage_container" "teste_sc" {
  name                  = var.azure_blob.name
  storage_account_name  = var.storage_account_name
  container_access_type = var.azure_blob.type
}