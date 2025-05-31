############################################
# STORAGE
############################################

resource "azurerm_storage_account" "tf_sa" {
  name                     = var.azure_storage.name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.azure_storage.tier
  account_replication_type = var.azure_storage.replic
}