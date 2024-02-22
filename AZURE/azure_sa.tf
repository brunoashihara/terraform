############################################
# STORAGE
############################################

resource "azurerm_storage_account" "teste_sa" {
  name                     = var.storage.name
  resource_group_name      = azurerm_resource_group.teste_rg.name
  location                 = azurerm_resource_group.teste_rg.location
  account_tier             = var.storage.tier
  account_replication_type = var.storage.replic
}