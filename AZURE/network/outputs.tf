############################################
# OUTPUT
############################################

output "linux_ip" {
  value = azurerm_public_ip.tf_ip_linux.ip_address
}

output "linux_public_ip_id" {
  value = azurerm_public_ip.tf_ip_linux.id
}

output "sb_private_id" {
  value = azurerm_subnet.tf_sb_private.id
}

output "sb_public_id" {
  value = azurerm_subnet.tf_sb_public.id
}

output "virtual_network_id" {
  value = azurerm_virtual_network.tf_vn.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.tf_vn.name
}

output "windows_ip" {
  value = azurerm_public_ip.tf_ip_windows.ip_address
}

output "windows_public_ip_id" {
  value = azurerm_public_ip.tf_ip_windows.id
}