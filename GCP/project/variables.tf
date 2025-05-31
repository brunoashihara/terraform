############################################
# PROJECT
############################################

variable "gcp_project" {
  description = "Project Variables"
  type = object({
    coringa = string
    name    = string
    region  = string
    zone    = string
  })
}