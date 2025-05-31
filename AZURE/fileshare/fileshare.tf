############################################
# FILESHARE
############################################

resource "azurerm_storage_share" "tf_fileshare" {
  name                 = var.azure_fileshare.name
  storage_account_name = var.storage_account_name
  quota                = var.azure_fileshare.quota
}

############################################
# FILESHARE PRIVATE ENDPOINT
############################################

resource "azurerm_private_endpoint" "tf_file_share_pe" {
  name                = "${var.storage_account_name}-pe"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  subnet_id           = var.sb_private_id

  private_service_connection {
    name                           = "${var.storage_account_name}-file-connection"
    private_connection_resource_id = var.storage_account_id
    subresource_names              = [var.azure_fileshare.sub_name]
    is_manual_connection           = false
  }

  tags = {
    environment = var.azure_fileshare.tag
  }
}
