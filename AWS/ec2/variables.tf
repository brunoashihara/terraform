############################################
# EC2
############################################

variable "aws_ec2" {
  description = "EC2 Variables"
  type  = object({
    li_sleep  = string
    li_name   = string
    li_ami    = string
    li_type   = string
    li_conn_t = string
    li_conn_u = string
    wi_name   = string
    wi_ami    = string
    wi_type   = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "efs_dns" {
  description = "EFS DNS"
  type        = string
}

variable "key_name" {
  description = "Key Name"
  type        = string
}

variable "private_key_pem" {
  description = "Private key"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet Public ID"
  type        = string
}

variable "sg_public_id" {
  description = "Security Group Public ID"
  type        = string
}