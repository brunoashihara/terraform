############################################
# ROUTE TABLE PRIVATE
############################################

variable "oci_rt_private" {
  description = "Route Table Private Variables"
  type = object({
    name = string
  })
}

############################################
# ROUTE TABLE PUBLIC
############################################ 

variable "oci_rt_public" {
  description = "Route Table Public Variables"
  type = object({
    name = string
    rules = list(object({
      cidr        = string
      description = string
      target      = string # "igw" ou "drg"
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

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet Public ID"
  type        = string
}

variable "vcn_id" {
  description = "VCN ID"
  type        = string
}