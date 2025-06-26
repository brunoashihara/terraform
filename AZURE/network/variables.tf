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
# SUBNET PRIVATE
############################################

variable "azure_sb_private" {
  description = "Subnet Private Variables"
  type = object({
    ip   = string
    name = string
  })
}

############################################
# SUBNET PUBLIC
############################################

variable "azure_sb_public" {
  description = "Subnet Public Variables"
  type = object({
    ip   = string
    name = string
  })
}

############################################
# VIRTUAL NETWORK
############################################

variable "azure_vn" {
  description = "Virtual Network Variables"
  type = object({
    ip   = string
    name = string
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