############################################
# OUTPUT
############################################

output "sg_private_id" {
  value = azurerm_network_security_group.tf_sg_private.id
}

output "sg_public_id" {
  value = azurerm_network_security_group.tf_sg_public.id
}