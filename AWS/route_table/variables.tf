############################################
# ROUTE TABLE PRIVATE
############################################

variable "aws_rt_private" {
  description = "Route Table Private Variables"
  type = object({
    name = string
  })
}

############################################
# ROUTE TABLE PUBLIC
############################################

variable "aws_rt_public" {
  description = "Route Table Public Variables"
  type = object({
    name    = string
    coringa = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "internet_gateway_id" {
  description = "Internet Gateway ID"
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

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}