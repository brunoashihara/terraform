############################################
# RDS
############################################

variable "aws_rds" {
  description = "RDS Variables"
  type = object({
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
    retention = number
    insights  = bool
  })
}