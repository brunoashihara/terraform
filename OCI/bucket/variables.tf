############################################
# BUCKET
############################################

variable "oci_bucket" {
  description = "Bucket variables"
  type = object({
    name      = string
    namespace = string
    tier      = string
    type      = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}