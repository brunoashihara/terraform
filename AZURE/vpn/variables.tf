############################################
# NETWORK
############################################

variable "azure_network" {
  description = "Network Variables"
  type = object({
    alloc     = string
    linux     = string
    vpn       = string
    vpn_alloc = string
    windows   = string
  })
}

############################################
# RESOURCE GROUP
############################################

variable "azure_resource_group" {
  description = "Resource group Variables"
  type = object({
    admin   = string
    name    = string
    onprem  = string
    pass    = string
    region  = string
  })
}

############################################
# SUBNET VPN
############################################

variable "azure_sb_vpn" {
  description = "Subnet VPN Variables"
  type = object({
    ip    = string
    name  = string
  })
}

############################################
# VPN
############################################

variable "azure_lng" {
  description = "Local Network Gateway Variables"
  type = object({
    gw    = string
    name  = string
  })
}

variable "azure_vng" {
  description = "Virtual Network Gateway Variables"
  type = object({
    alloc     = string
    ip        = string
    sku       = string
    name      = string
    type      = string
    vtype     = string
  })
}

variable "azure_vng_connection" {
  description = "Virtual Network Gateway Connection Variables"
  type = object({
    dh        = string
    encrypt   = string
    integrity = string
    key       = string
    name      = string
    pfs       = string
    type      = string
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

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
}