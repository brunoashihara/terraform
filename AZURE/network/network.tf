############################################
# VIRTUAL NETWORK
############################################

resource "azurerm_virtual_network" "tf_vn" {
  name                = var.azure_vn.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = [var.azure_vn.ip]
}

############################################
# SUBNET PUBLIC
############################################

resource "azurerm_subnet" "tf_sb_public" {
  #checkov:skip=CKV2_AZURE_31 There is a NSG module that associate with this subnet
  name                 = var.azure_sb_public.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.tf_vn.name
  address_prefixes     = [var.azure_sb_public.ip]
}

############################################
# SUBNET PRIVATE
############################################

resource "azurerm_subnet" "tf_sb_private" {
  #checkov:skip=CKV2_AZURE_31 There is a NSG module that associate with this subnet
  name                 = var.azure_sb_private.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.tf_vn.name
  address_prefixes     = [var.azure_sb_private.ip]

  delegation {
    name = "delegation"
    service_delegation {
      name = "Microsoft.ContainerInstance/containerGroups"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
    }
  }
}

############################################
# NETWORK LINUX
############################################

resource "azurerm_public_ip" "tf_ip_linux" {
  name                = var.azure_network.linux
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.azure_network.alloc
}

############################################
# NETWORK WINDOWS
############################################

resource "azurerm_public_ip" "tf_ip_windows" {
  name                = var.azure_network.windows
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = var.azure_network.alloc
}