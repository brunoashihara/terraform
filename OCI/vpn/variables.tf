############################################
# Customer Premises Equipament
############################################

variable "oci_cpe" {
  description = "Customer Premises Equipament Variables"
  type = object({
    ip   = string
    name = string
  })
}

############################################
# Dynamic Routing Gateway
############################################

variables "oci_drg" {
  description = "Dynamic Routing Gateway Variables"
  type = object({
    name = string
  })
}

############################################
# Dynamic Routing Gateway Attachment
############################################

variable "oci_drg_attach" {
  description = "Dynamic Routing Gateway Attachment Variables"
  type = object({
  name = string
  type = string
  })
}

############################################
# IPSec
############################################

variable "oci_ipsec" {
  description = "IPSec Variables"
  type = object({
    cpe        = string
    ident_type = string
    name       = string
    static     = list(string)
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}

variable "vcn_id" {
  description = "VCN ID"
  type        = string
}