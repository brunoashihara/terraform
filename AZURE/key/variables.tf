############################################
# KEY
############################################

variable "azure_key" {
  description = "Key Variables"
  type = object({
    algo    = string
    bits    = string
    private = string
    perm    = string
    ssh     = string
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
