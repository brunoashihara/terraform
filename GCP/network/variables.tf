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
# SUBNET PRIVATE
############################################

variable "gcp_sb_private" {
  description = "Subnet Private Variables"
  type = object({
    ip   = string
    name = string
  })
}

############################################
# SUBNET PUBLIC
############################################

variable "gcp_sb_public" {
  description = "Subnet Public Variables"
  type = object({
    ip   = string
    name = string
  })
}

############################################
# VPC
############################################

variable "gcp_vpc" {
  description = "VPC Variables"
  type = object({
    name = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}