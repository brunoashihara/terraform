############################################
# COMPUTE
############################################

variable "gcp_compute" {
  description = "Compute Variables"
  type = object({
    li_img  = string
    li_ip   = string
    li_name = string
    li_type = string
    size    = number
    type    = string
    wi_img  = string
    wi_ip   = string
    wi_name = string
    wi_type = string
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

variable "filestore_ip" {
  description = "Filestore IP"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "public_key_openssh" {
  description = "Created public key"
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