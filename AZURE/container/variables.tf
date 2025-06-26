############################################
# CONTAINER
############################################

variable "azure_container" {
  description = "Container Variables"
  type = object({
    ctn_cpu   = string
    ctn_img   = string
    ctn_mem   = string
    ctn_name  = string
    ctn_port  = number
    ctn_proto = string
    ip        = string
    name      = string
    os        = string
    identity  = string
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