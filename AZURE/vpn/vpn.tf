############################################
# SUBNET VPN
############################################
resource "azurerm_subnet" "tf_sb_vpn" {
  name                 = var.azure_sb_vpn.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.azure_sb_vpn.ip]
}

############################################
# NETWORK VPN
############################################

resource "azurerm_public_ip" "tf_vpn" {
  name                = var.azure_network.vpn
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.azure_network.vpn_alloc
}

############################################
# VPN VIRTUAL NETWORK GATEWAY
############################################

resource "azurerm_virtual_network_gateway" "tf_gw" {
  name                = var.azure_vng.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  type                = var.azure_vng.type
  vpn_type            = var.azure_vng.vtype
  active_active       = false
  enable_bgp          = false
  sku                 = var.azure_vng.sku
  ip_configuration {
    name                          = var.azure_vng.ip
    public_ip_address_id          = azurerm_public_ip.tf_vpn.id
    private_ip_address_allocation = var.azure_vng.alloc
    subnet_id                     = azurerm_subnet.tf_sb_vpn.id
  }
}

############################################
# VPN LOCAL NETWORK GATEWAY
############################################

resource "azurerm_local_network_gateway" "tf_local" {
  name                = var.azure_lng.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  gateway_address     = var.azure_lng.gw
  address_space       = [var.azure_resource_group.onprem]
}

############################################
# VPN VIRTUAL NETWORK GATEWAY CONNECTION
############################################

resource "azurerm_virtual_network_gateway_connection" "tf_ngc" {
  name                       = var.azure_vng_connection.name
  location                   = var.resource_group_location
  resource_group_name        = var.resource_group_name
  type                       = var.azure_vng_connection.type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.tf_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.tf_local.id
  ipsec_policy {
    dh_group         = var.azure_vng_connection.dh
    ike_encryption   = var.azure_vng_connection.encrypt
    ike_integrity    = var.azure_vng_connection.integrity
    ipsec_encryption = var.azure_vng_connection.encrypt
    ipsec_integrity  = var.azure_vng_connection.integrity
    pfs_group        = var.azure_vng_connection.pfs
  }
  shared_key = var.azure_vng_connection.key
}

