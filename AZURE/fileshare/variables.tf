############################################
# FILESHARE
############################################

variable "azure_fileshare" {
  description = "Fileshare Variables"
  type = object({
    name     = string
    quota    = number
    sub_name = string
    tag      = string
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

variable "storage_account_id" {
  description = "Storage Account ID"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}
