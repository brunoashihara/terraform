############################################
# FILESHARE
############################################

resource "azurerm_storage_share" "teste_share" {
  name                 = var.fileshare.name
  storage_account_name = azurerm_storage_account.teste_sa.name
  quota                = var.fileshare.quota
}