############################################
# OUTPUT
############################################

output "dns_zone_id" {
  value = azurerm_private_dns_zone.tf_file.id
}

output "dns_zone_name" {
  value = azurerm_private_dns_zone.tf_file.name
}

output "dns_zone_vnet_link_id" {
  value = azurerm_private_dns_zone_virtual_network_link.tf_vnet_link.id
}