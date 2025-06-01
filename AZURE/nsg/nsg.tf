############################################
# NETWORK SECURITY GROUPS PRIVATE
############################################

resource "azurerm_network_security_group" "tf_sg_private" {
  name                = var.azure_nsg_private.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

############################################
# NETWORK SECURITY GROUPS PUBLIC
############################################

resource "azurerm_network_security_group" "tf_sg_public" {
  name                = var.azure_nsg_public.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

############################################
# NETWORK SECURITY GROUPS PRIVATE RULES
###########################################

resource "azurerm_network_security_rule" "tf_sg_private_rule" {
  for_each                    = var.azure_nsg_private.rules
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.tf_sg_private.name
}

############################################
# NETWORK SECURITY GROUPS PUBLIC RULES
############################################

resource "azurerm_network_security_rule" "tf_sg_public_rules" {
  for_each                    = var.azure_nsg_public.rules
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.tf_sg_public.name
}

############################################
# NETWORK SECURITY GROUPS ASSOCIATE SUBNET PRIVATE
############################################

resource "azurerm_subnet_network_security_group_association" "tf_assoc_subnet_private" {
  subnet_id                 = var.sb_private_id
  network_security_group_id = azurerm_network_security_group.tf_sg_private.id
}

############################################
# NETWORK SECURITY GROUPS ASSOCIATE SUBNET PUBLIC
############################################

resource "azurerm_subnet_network_security_group_association" "tf_assoc_subnet_public" {
  subnet_id                 = var.sb_public_id
  network_security_group_id = azurerm_network_security_group.tf_sg_public.id
}