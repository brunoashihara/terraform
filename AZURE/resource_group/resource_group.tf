############################################
# RESOURCE GROUP
############################################

resource "azurerm_resource_group" "tf_rg" {
  name     = var.azure_resource_group.name
  location = var.azure_resource_group.region
}