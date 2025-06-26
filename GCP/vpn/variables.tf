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
    local     = string
    remote    = string
    rt_name   = string
    rt_prio   = number
    tunnel    = string
  })
}

############################################
# VPN FORWARD RULE
############################################

variable "gcp_vpn_fr" {
  description = "VPN FR Variables"
  type = object({
    name_4500 = string
    name_500  = string
    port_500  = string
    prot_500  = string
    port_4500 = string
    prot_4500 = string
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