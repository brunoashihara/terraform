############################################
# STORAGE
############################################

variable "gcp_storage" {
  description = "Storage Variables"
  type = object({
    class     = string
    entity    = string
    location  = string
    name      = string
    role      = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}