############################################
# SECURITY GROUP PRIVATE
############################################

variable "aws_sg_private" {
  description = "Security Group Private Variables"
  type = object({
    name = string
    desc = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}


############################################
# SECURITY GROUP PUBLIC
############################################

variable "aws_sg_public" {
  description = "Security Group Public Variables"
  type = object({
    name = string
    desc = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}