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
# VPC
############################################

variable "gcp_vpc" {
  description = "VPC Variables"
  type = object({
    name = string
  })
}

############################################
# VPN
############################################

variable "gcp_vpn" {
  description = "VPN Variables"
  type = object({
    gw        = string
    ip        = string
    key       = string
    onprem    = string
    onprem_sb = string
    rt_name   = string
    rt_prio   = number
    tunnel    = string
  })
}

variable "gcp_vpn_fr" {
  description = "VPN FR Variables"
  type = object({
    4500_name = string
    4500_port = string
    4500_prot = string
    500_name  = string
    500_port  = string
    500_prot  = string
    esp_name  = string
    esp_prot  = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}