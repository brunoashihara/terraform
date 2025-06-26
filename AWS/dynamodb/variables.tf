############################################
# DYNAMODB
############################################

variable "aws_dynamodb" {
  description = "Dynamodb Variables"
  type = object({
    name            = string
    billing         = string
    r_cap           = number
    w_cap           = number
    hash            = string
    r_key           = string
    attr_type       = string
    ttl_name        = string
    max_cap         = number
    min_cap         = number
    read_scale_dim  = string
    write_scake_dim = string
    read_metric     = string
    write_metric    = string
    service_ns      = string
    policy          = string
    target          = number
    scale_in        = number
    scale_out       = number
  })
}