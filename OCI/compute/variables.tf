############################################
# COMPUTE
############################################

variable "oci_compute" = {
  description = "Compute Variables"
  type = object({
    ad          = string
    img         = string
    name        = string
    public      = bool
    shape = {
      ocpus = number
      mem   = number
      name  = string
    }
    source_type = string
    type        = string
    user        = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}

variable "mount_ip" {
  description = "Mount IP"
  type        = string
}

variable "nsg_id" {
  description = "nsg ID"
  type        = string
}

variable "private_key" {
  description = "Private key"
  type        = string
}

variable "public_key_openssh" {
  description = "Public key"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet ID"
  type        = string
}