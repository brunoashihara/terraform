############################################
# BUCKET
############################################

variable "oci_bucket" {
  description = "Bucket variables"
  type = object({
    name             = string
    namespace        = string
    type             = string
    tier             = string
    version          = string
    lifecycle_name   = string
    lifecycle_action = string
    lifecycle_target = string
    lifecycle_time   = number
    lifecycle_unit   = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}