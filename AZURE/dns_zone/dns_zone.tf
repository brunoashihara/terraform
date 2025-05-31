############################################
# PRIVATE DNS
############################################

resource "azurerm_private_dns_zone" " tf_file" {
  name                = var.azure_dns_zone.name
  resource_group_name = var.resource_group_name
}

############################################
# PRIVATE DNS VIRTUAL NETWORK LINK
############################################

resource "azurerm_private_dns_zone_virtual_network_link" "tf_vnet_link" {
  name                  = "${var.azure_dns_zone.name}-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.tf_file.name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = false
}