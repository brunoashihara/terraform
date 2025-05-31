############################################
# DYNAMODB
############################################

variable "aws_dynamodb" {
  description = "Dynamodb Variables"
  type  = object({
    name      = string
    billing   = string
    r_cap     = number
    w_cap     = number
    hash      = string
    r_key     = string
    attr_type = string
    ttl_name  = string
  })
}