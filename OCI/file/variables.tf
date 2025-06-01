############################################
# EXPORT
############################################

variable "oci_export" {
  description = "Export Variables"
  type = object({
    path = string
  })
}

############################################
# FILE STORAGE
############################################

variable "oci_file" {
  description = "File Storage Variables"
  type = object({
    ad   = string
    name = string
  })
}

############################################
# MOUNT TARGET
############################################

variable "oci_mount" {
  description = "Mount Target Variables"
  type = object({
    ad   = string
    name = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}

variable "nsg_private_id" {
  description = "NSG Private ID"
  type        = string
}

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}