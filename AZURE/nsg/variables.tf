############################################
# NETWORK SECURITY GROUPS PRIVATE
############################################

variable "azure_nsg_private" {
  description = "Network Security Group Private Variables"
  type = object({
    name                       = string
    rule_name                  = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_address_prefix      = string
    destination_address_prefix = string
    source_port_range          = string
    destination_port_range     = string
  })
}

############################################
# NETWORK SECURITY GROUPS PUBLIC
############################################

variable "azure_nsg_public" {
  description = "Network Security Group Public Variables"
  type = object({
    name  = string
    rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet Public ID"
  type        = string
}