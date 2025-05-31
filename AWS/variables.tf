############################################
# DYNAMODB
############################################

variable "aws_dynamodb" {
  description = "Dynamodb Variables"
  type  = object({
    attr_type = string
    billing   = string
    hash      = string
    name      = string
    r_cap     = number
    r_key     = string
    ttl_name  = string
    w_cap     = number
  })
}

############################################
# EC2
############################################

variable "aws_ec2" {
  description = "EC2 Variables"
  type  = object({
    li_ami    = string
    li_conn_t = string
    li_conn_u = string
    li_name   = string
    li_sleep  = string
    li_type   = string
    wi_ami    = string
    wi_name   = string
    wi_type   = string
  })
}

############################################
# EFS
############################################

variable "aws_efs" {
  description = "EFS Variables"
  type  = object({
    name     = string
  })
}

############################################
# KEYS
############################################

variable "aws_key" {
  description = "Key Variables"
  type  = object({
    algo      = string
    perm      = string
    private   = string
    public    = string
  })
}

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
# RDS
############################################

variable "aws_rds" {
  description = "RDS Variables"
  type  = object({
    class     = string
    engine    = string
    ident     = string
    name      = string
    parameter = string
    pass      = string
    port      = string
    stg       = number
    user      = string
    version   = string
  })
}

############################################
# REGION
############################################

variable "aws_region" {
  description = "Region Variables"
  type  = object({
    name    = string
    true    = string
  })
}

############################################
# ROUTE TABLE PRIVATE
############################################

variable "aws_rt_private" {
  description = "Route Table Private Variables"
  type  = object({
    name    = string
  })
}

############################################
# ROUTE TABLE PUBLIC
############################################

variable "aws_rt_public" {
  description = "Route Table Public Variables"
  type  = object({
    coringa = string
    name    = string
  })
}

############################################
# S3
############################################

variable "aws_s3" {
  description = "S3 Variables"
  type  = object({
    name     = string
  })
}

############################################
# SECURITY GROUP PRIVATE
############################################

variable "aws_sg_private" {
  description = "Security Group Private Variables"
  type = object({
    name    = string
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
    name    = string
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