############################################
# OUTPUT
############################################

output "vpn_ip" {
  value = azurerm_public_ip.tf_vpn.ip_address
}