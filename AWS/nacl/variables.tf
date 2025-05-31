############################################
# NETWORK ACCESS CONTROL LIST PRIVATE
############################################

variable "aws_nacl_private" {
  description = "Network Access Control List Private Variables"
  type  = object({
    name  = string
    rules = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
      egress     = bool
    }))
  })
}

############################################
# NETWORK ACCESS CONTROL LIST PUBLIC
############################################

variable "aws_nacl_public" {
  description = "Network Access Control List Public Variables"
  type  = object({
    name  = string
    rules = list(object({
      rule_no    = number
      action     = string
      protocol   = string
      cidr_block = string
      from_port  = number
      to_port    = number
      egress     = bool
    }))
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet Public ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}