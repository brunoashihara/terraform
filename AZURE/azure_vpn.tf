############################################
# SUBNET VPN
############################################
resource "azurerm_subnet" "teste_sb_gateway" {
  name                 = var.sb_vpn.name
  resource_group_name  = azurerm_resource_group.teste_rg.name
  virtual_network_name = azurerm_virtual_network.teste_vn.name
  address_prefixes     = [var.sb_vpn.ip]
}

############################################
# NETWORK VPN
############################################

resource "azurerm_public_ip" "teste_vpn" {
  name                = var.network.vpn
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  allocation_method   = var.network.vpn_alloc
}

############################################
# VPN VIRTUAL NETWORK GATEWAY
############################################

resource "azurerm_virtual_network_gateway" "teste_gw" {
  name                = var.vng.name
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  type                = var.vng.type
  vpn_type            = var.vng.vtype
  active_active       = false
  enable_bgp          = false
  sku                 = var.vng.sku
  ip_configuration {
    name                          = var.vng.ip
    public_ip_address_id          = azurerm_public_ip.teste_vpn.id
    private_ip_address_allocation = var.vng.alloc
    subnet_id                     = azurerm_subnet.teste_sb_gateway.id
  }
}

############################################
# VPN LOCAL NETWORK GATEWAY
############################################

resource "azurerm_local_network_gateway" "teste_local" {
  name                = var.lng.name
  resource_group_name = azurerm_resource_group.teste_rg.name
  location            = azurerm_resource_group.teste_rg.location
  gateway_address     = var.lng.gw
  address_space       = [var.rg.onprem]
}

############################################
# VPN VIRTUAL NETWORK GATEWAY CONNECTION
############################################

resource "azurerm_virtual_network_gateway_connection" "teste_ngc" {
  name                       = var.vng_connection.name
  location                   = azurerm_resource_group.teste_rg.location
  resource_group_name        = azurerm_resource_group.teste_rg.name
  type                       = var.vng_connection.type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.teste_gw.id
  local_network_gateway_id   = azurerm_local_network_gateway.teste_local.id
  ipsec_policy {
    dh_group         = var.vng_connection.dh
    ike_encryption   = var.vng_connection.encrypt
    ike_integrity    = var.vng_connection.integrity
    ipsec_encryption = var.vng_connection.encrypt
    ipsec_integrity  = var.vng_connection.integrity
    pfs_group        = var.vng_connection.pfs
  }
  shared_key = var.vng_connection.key
}

