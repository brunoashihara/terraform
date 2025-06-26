############################################
# FIRESTORE
############################################

variable "gcp_firestore" {
  description = "Firestore Variables"
  type = object({
    concur   = string
    engine   = string
    location = string
    name     = string
    type     = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}