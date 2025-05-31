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