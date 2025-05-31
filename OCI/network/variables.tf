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

oci_sb_private = {
  cidr   = "10.250.120.0/24"
  name   = "tf-sb-private"
  public = false
  label  = "private"
}

############################################
# SUBNET PUBLIC
############################################

oci_sb_public = {
  cidr    = "10.250.121.0/24"
  name    = "tf-sb-public"
  public  = true
  label   = "public"
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