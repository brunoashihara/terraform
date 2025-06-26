############################################
# CONTAINER
############################################

resource "azurerm_container_group" "tf_ctn" {
  #checkov:skip=CKV_AZURE_98: Have already done the configuration
  name                = var.azure_container.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.azure_container.ip
  os_type             = var.azure_container.os
  subnet_ids          = [var.sb_private_id]
  identity {
    type = var.azure_container.identity
  }
  container {
    name   = var.azure_container.ctn_name
    image  = var.azure_container.ctn_img
    cpu    = var.azure_container.ctn_cpu
    memory = var.azure_container.ctn_mem
    ports {
      port     = var.azure_container.ctn_port
      protocol = var.azure_container.ctn_proto
    }
  }
}