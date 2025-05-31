############################################
# AUTONOMOUS DATABASE
############################################

variable "oci_autonomousdb" {
  description = "Autonomous Database Variables"
  type = object({
    backup    = string
    db_name   = string
    free      = string
    name      = string
    pass      = string
    retention = number
    version   = string 
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "compartment_id" {
  description = "Compartment ID"
  type        = string
}