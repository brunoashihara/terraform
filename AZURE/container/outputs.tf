############################################
# OUTPUT
############################################

output "container_ip" {
  value = azurerm_container_group.tf_ctn.ip_address
}