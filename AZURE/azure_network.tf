############################################
# VIRTUAL NETWORK
############################################

resource "azurerm_virtual_network" "teste_vn" {
  name                = var.vn.name
  resource_group_name = azurerm_resource_group.teste_rg.name
  location            = azurerm_resource_group.teste_rg.location
  address_space       = [var.vn.ip]
}

############################################
# SUBNET PUBLIC
############################################

resource "azurerm_subnet" "teste_sb_public" {
  name                 = var.sb_public.name
  resource_group_name  = azurerm_resource_group.teste_rg.name
  virtual_network_name = azurerm_virtual_network.teste_vn.name
  address_prefixes     = [var.sb_public.ip]
}

############################################
# SUBNET PRIVATE
############################################

resource "azurerm_subnet" "teste_sb_private" {
  name                 = var.sb_private.name
  resource_group_name  = azurerm_resource_group.teste_rg.name
  virtual_network_name = azurerm_virtual_network.teste_vn.name
  address_prefixes     = [var.sb_private.ip]
}

############################################
# NETWORK LINUX
############################################

resource "azurerm_public_ip" "teste_ip_linux" {
  name                = var.network.linux
  resource_group_name = azurerm_resource_group.teste_rg.name
  location            = azurerm_resource_group.teste_rg.location
  allocation_method   = var.network.alloc
}

############################################
# NETWORK WINDOWS
############################################

resource "azurerm_public_ip" "teste_ip_windows" {
  name                = var.network.windows
  resource_group_name = azurerm_resource_group.teste_rg.name
  location            = azurerm_resource_group.teste_rg.location
  allocation_method   = var.network.alloc
}

############################################
# NETWORK SECURITY GROUPS PUBLIC
############################################

resource "azurerm_network_security_group" "teste_sg_public" {
  name                = var.nsg_public.name
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  security_rule {
    name                       = var.nsg_public.ssh
    priority                   = var.nsg_public.ssh_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.ssh_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.rdp
    priority                   = var.nsg_public.rdp_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.rdp_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.web
    priority                   = var.nsg_public.web_prio
    direction                  = var.nsg_public.direc
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.web_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.postgres
    priority                   = var.nsg_public.postgres_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.postgres_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.sql
    priority                   = var.nsg_public.sql_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.sql_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.smb
    priority                   = var.nsg_public.smb_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.tcp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.smb_port
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
  security_rule {
    name                       = var.nsg_public.icmp
    priority                   = var.nsg_public.icmp_prio
    direction                  = var.nsg_public.direct
    access                     = var.nsg_public.access
    protocol                   = var.nsg_public.icmp
    source_port_range          = var.nsg_public.coringa
    destination_port_range     = var.nsg_public.coringa
    source_address_prefix      = var.nsg_public.coringa
    destination_address_prefix = var.nsg_public.coringa
  }
}

############################################
# NETWORK INTERFACE LINUX
############################################

resource "azurerm_network_interface" "teste_ni_linux" {
  name                = var.ni.linux
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  ip_configuration {
    name                          = var.ni.name
    subnet_id                     = azurerm_subnet.teste_sb_public.id
    private_ip_address_allocation = var.ni.alloc
    public_ip_address_id          = azurerm_public_ip.teste_ip_linux.id
  }
}

############################################
# NETWORK INTERFACE LINUX ASSOCIATION
############################################

resource "azurerm_network_interface_security_group_association" "teste_ISG_linux" {
  network_interface_id      = azurerm_network_interface.teste_ni_linux.id
  network_security_group_id = azurerm_network_security_group.teste_sg_public.id
}

############################################
# NETWORK INTERFACE WINDOWS
############################################

resource "azurerm_network_interface" "teste_ni_windows" {
  name                = var.ni.windows
  location            = azurerm_resource_group.teste_rg.location
  resource_group_name = azurerm_resource_group.teste_rg.name
  ip_configuration {
    name                          = var.ni.name
    subnet_id                     = azurerm_subnet.teste_sb_public.id
    private_ip_address_allocation = var.ni.alloc
    public_ip_address_id          = azurerm_public_ip.teste_ip_windows.id
  }
}

############################################
# NETWORK INTERFACE WINDOWS ASSOCIATION
############################################

resource "azurerm_network_interface_security_group_association" "teste_ISG_windows" {
  network_interface_id      = azurerm_network_interface.teste_ni_windows.id
  network_security_group_id = azurerm_network_security_group.teste_sg_public.id
}