############################################
# INTERNET GATEWAY
############################################

variable "oci_igw" {
  description = "Internet Gateway Variables"
  type = object({
    name = string
  })
}

############################################
# SUBNET PRIVATE
############################################

variable "oci_sb_private" {
  description = "Subnet Private Variables"
  type = object({
    cidr   = string
    name   = string
    public = bool
    label  = string
  })
}

############################################
# SUBNET PUBLIC
############################################

variable "oci_sb_public" {
  description = "Subnet Public Variables"
  type = object({
    cidr   = string
    name   = string
    public = bool
    label  = string
  })
}

############################################
# VCN
############################################

variable "oci_vcn" {
  description = "VCN Variables"
  type = object({
    cidr = list(string)
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