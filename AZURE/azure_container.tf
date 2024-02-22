############################################
# CONTAINER
############################################

resource "azurerm_container_group" "teste_ctn" {
  name                = var.container.name
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  ip_address_type     = var.container.ip
  os_type             = var.container.os
  container {
    name   = var.container.ctn_name
    image  = var.container.ctn_img
    cpu    = var.container.ctn_cpu
    memory = var.container.ctn_mem
    ports {
      port     = var.container.ctn_port
      protocol = var.container.ctn_proto
    }
  }
  exposed_port {
    port     = var.container.ctn_port
    protocol = var.container.ctn_proto
  }
}