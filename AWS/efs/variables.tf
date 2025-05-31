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
# OUTPUT VARIABLES
############################################

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}

variable "sg_private_id" {
  description = "Security Group Private ID"
  type        = string
}