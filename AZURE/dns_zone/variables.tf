############################################
# DNS ZONE
############################################

variable "azure_dns_zone" {
  description = "DNS Zone Variables"
  type = object({
    name = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "virtual_network_id" {
  description = "Virtual Network ID"
  type        = string
}