############################################
# PROJECT
############################################

variable "gcp_project" {
  description = "Project Variables"
  type = object({
    name   = string
    region = string
    zone   = string
  })
}