############################################
# AUTONOMOUS DATABASE
############################################

variable "oci_autonomousdb" {
  description = "Autonomous Database Variables"
  type = object({
    backup    = string
    db_name   = string
    free      = string
    name      = string
    pass      = string
    retention = number
    version   = string 
  })
}

############################################
# BUCKET
############################################

variable "oci_bucket" {
  description = "Bucket Variables"
  type = object({
    name      = string
    namespace = string
    tier      = string
    type      = string
  })
}

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
# COMPARTMENT
############################################

variable "oci_compartment" {
  description = "Compartment Variables"
  type = object({
    ad     = string
    delete = bool
    desc   = string
    name   = string
  })
}

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
# INTERNET GATEWAY
############################################

variable "oci_igw" {
  description = "Internet Gateway Variables"
  type = object({
    name = string
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
# KEY
############################################

variable "oci_key" {
  description = "IPSec Variables"
  type = object({
    algo = string
    bit  = string
    file = string
    perm = string
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
# NETWORK SECURITY GROUP PRIVATE
############################################

variable "oci_nsg_private" {
  description = "NSG Private Variables"
  type = object({
    name           = string
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
    name           = string
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
# ROUTE TABLE PRIVATE
############################################

variable "oci_rt_private" {
  description = "Route Table Private Variables"
  type = object({
    name      = string
  })
}

############################################
# ROUTE TABLE PUBLIC
############################################

variable "oci_rt_public" {
  description = "Route Table Public Variables"
  type = object({
    name  = string
    rules = list(object({
      cidr        = string
      description = string
      target      = string
    }))
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