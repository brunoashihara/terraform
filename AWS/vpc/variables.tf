############################################
# SUBNET PRIVATE
############################################

variable "aws_sb_private" {
  description = "Subnet Private Variables"
  type  = object({
    cidr      = string
    name      = string
  })
}

############################################
# SUBNET PUBLIC
############################################

variable "aws_sb_public" {
  description = "Subnet Public Variables"
  type  = object({
    cidr      = string
    name      = string
  })
}

############################################
# VPC
############################################

variable "aws_vpc" {
  description = "VPC Variables"
  type  = object({
    cidr      = string
    igw       = string
    name      = string
  })
}