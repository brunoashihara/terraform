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

variable "nsg_id" {
  description = "nsg ID"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet ID"
  type        = string
}