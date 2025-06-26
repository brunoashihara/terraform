############################################
# STORAGE ACCOUNT
############################################

variable "azure_storage" {
  description = "Storage Account Variables"
  type = object({
    name   = string
    replic = string
    tier   = string
    tls    = string
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