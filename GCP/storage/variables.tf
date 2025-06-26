############################################
# STORAGE
############################################

variable "gcp_storage" {
  description = "Storage Variables"
  type = object({
    class    = string
    location = string
    name     = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}