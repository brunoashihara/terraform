############################################
# COSMODB
############################################

variable "azure_cosmodb" {
  description = "Container Variables"
  type = object({
    cap1     = string
    cap2     = string
    cap3     = string
    cap4     = string
    cons     = string
    failover = number
    kind     = string
    location = string
    name     = string
    type     = string
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