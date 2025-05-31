############################################
# RDS
############################################

variable "aws_rds" {
  description = "RDS Variables"
  type  = object({
    name      = string
    stg       = number
    engine    = string
    version   = string
    class     = string
    user      = string
    pass      = string
    port      = string
    parameter = string
    ident     = string
  })
}