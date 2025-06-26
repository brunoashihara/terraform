############################################
# GOOGLE KUBERNETES ENGINE
############################################

variable "gcp_gke" {
  description = "Google Kubernetes Engine Variables"
  type = object({
    count     = number
    name      = string
    oauth     = string
    labels    = map(string)
    tags      = list(string)
    to_create = string
    to_update = string
    enable    = bool
    disable   = bool
    cidr      = string
    auth_name = string
    metadata  = string
    provider  = string
    binary    = string
  })
}

############################################
# OTHERS VARIABLES
############################################

variable "region" {
  description = "Region variable"
  type        = string
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

variable "authorized_cidr" {
  description = "Subnet Private CIDR"
  type        = string
}