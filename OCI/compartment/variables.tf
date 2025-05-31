############################################
# COMPARTMENT
############################################

variable "oci_compartment" {
  description = "Compartment variables"
  type = object({
    ad     = string
    delete = bool
    desc   = string
    name   = string
  })
}