############################################
# OUTPUT
############################################

output "fileshare_url" {
  value = azurerm_storage_share.tf_fileshare.url
}