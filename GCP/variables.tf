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
    tags    = list(string)
    type    = string
    wi_img  = string
    wi_ip   = string
    wi_name = string
    wi_type = string
  })
}

############################################
# FILESTORE
############################################

variable "gcp_filestore" {
  description = "Filestore Variables"
  type = object({
    cap      = number
    name     = string
    network  = string
    share    = string
    tier     = string
    ip_range = string
  })
}

############################################
# FIRESTORE
############################################

variable "gcp_firestore" {
  description = "Firestore Variables"
  type = object({
    concur   = string
    engine   = string
    location = string
    name     = string
    type     = string
  })
}

############################################
# FW PRIVATE
############################################

variable "gcp_fw_private" {
  description = "Firewall Private Variables"
  type = list(object({
    name          = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
  }))
}

############################################
# FW PUBLIC
############################################

variable "gcp_fw_public" {
  description = "Firewall Public Variables"
  type = list(object({
    name          = string
    protocol      = string
    ports         = list(string)
    source_ranges = list(string)
    target_tags   = optional(list(string), [])
  }))
}

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
# KEY
############################################

variable "gcp_key" {
  description = "Key Variables"
  type = object({
    algo    = string
    perm    = string
    private = string
    rsa     = number
  })
}

############################################
# POSTGRES
############################################

variable "gcp_postgres" {
  type = object({
    name    = string
    version = string
    tier    = string
    enable  = bool
    disable = bool
    time    = string
    backup  = number
    unit    = string
    auth    = string
    pass    = string
    user    = string
  })
}

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

############################################
# SQL
############################################

variable "gcp_sql" {
  description = "SQL Variables"
  type = object({
    name = string
  })
}

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