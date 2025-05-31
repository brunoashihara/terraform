############################################
# SECURITY GROUP PRIVATE
############################################

variable "aws_sg_private" {
  description = "Security Group Private Variables"
  type  = object({
    all       = number
    name      = string
    protocol  = string
  })
}

############################################
# SECURITY GROUP PUBLIC
############################################

variable "aws_sg_public" {
  description = "Security Group Public Variables"
  type  = object({
    all       = number
    coringa   = string
    icmp      = string
    name      = string
    nfs       = number
    protocol  = string
    rdp       = number
    ssh       = number
    tcp       = string
    udp       = string
    web       = number
    web_ssl   = number
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}