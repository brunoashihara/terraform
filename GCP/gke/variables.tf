############################################
# GOOGLE KUBERNETES ENGINE
############################################

variable "gcp_gke" {
  description = "Google Kubernetes Engine Variables"
  type = object({
    count     = number
    name      = string
    oauth     = string
    tags      = list(string)
    to_create = string
    to_update = string
  })
}

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

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "sb_public_id" {
  description = "Subnet ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}