############################################
# BLOB
############################################

resource "azurerm_storage_container" "teste_sc" {
  name                  = var.blob.name
  storage_account_name  = azurerm_storage_account.teste_sa.name
  container_access_type = var.blob.type
}