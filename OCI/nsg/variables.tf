############################################
# NETWORK SECURITY GROUP PRIVATE
############################################

variable "oci_nsg_private" {
  description = "NSG Private Variables"
  type = object({
    name = string
    ingress_rules = list(object({
      protocol    = string
      source_type = string
      source      = string
      description = optional(string)
      stateless   = optional(bool)
    }))
    egress_rules = list(object({
      protocol         = string
      destination_type = string
      destination      = string
      description      = optional(string)
      stateless        = optional(bool)
    }))
  })
}

############################################
# NETWORK SECURITY GROUP PUBLIC
############################################

variable "oci_nsg_public" {
  description = "NSG Public Variables"
  type = object({
    name = string
    ingress_rules = list(object({
      protocol    = string
      source_type = string
      source      = string
      description = optional(string)
      stateless   = optional(bool)
    }))
    egress_rules = list(object({
      protocol         = string
      destination_type = string
      destination      = string
      description      = optional(string)
      stateless        = optional(bool)
    }))
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