############################################
# PROJECT
############################################

variable "project" {
  description = "Variaveis do projeto"
  default     = {
    name      = "teste-gcp-terraform-teste"
    region    = "us-central1"
    zone      = "us-central1-c"
    service   = "cloudresourcemanager.googleapis.com"
    coringa   = "0.0.0.0/0"
  }
}

############################################
# COMPUTE
############################################

variable "compute" {
  description = "Variaveis compute"
  default     = {
    service   = "compute.googleapis.com"
    li_ip     = "teste-linux-ip"
    wi_ip     = "teste-windows-ip"
    li_name   = "teste-linux"
    li_type   = "e2-micro"
    li_img    = "debian-cloud/debian-12"
    wi_name   = "teste-windows"
    wi_type   = "e2-micro"
    wi_img    = "windows-cloud/windows-server-2022-dc-v20230712"
  }
}

############################################
# FILESTORE
############################################

variable "filestore" {
  description = "Variaveis filestore"
  default     = {
    service   = "file.googleapis.com"
    name      = "teste-filestore"
    tier      = "BASIC_HDD"
    cap       = 1024
    share     = "filestore"
    network   = "MODE_IPV4"
  }
}

############################################
# FIRESTORE
############################################

variable "firestore" {
  description = "Variaveis firestore"
  default     = {
    service   = "firestore.googleapis.com"
    name      = "(default)"
    type      = "FIRESTORE_NATIVE"
    location  = "nam5"
    concur    = "OPTIMISTIC"
    engine    = "DISABLED"
  }
}

############################################
# K8e
############################################

variable "k8e" {
  description = "Variaveis k8s"
  default     = {
    service   = "container.googleapis.com"
    name      = "teste-k8e"
    oauth     = "https://www.googleapis.com/auth/cloud-platform"
    count     = 1
    tags      = ["environment", "training"]
    to_create = "30m"
    to_update = "40m"
  }
}

############################################
# KEY
############################################

variable "key" {
  description = "Variaveis key"
  default     = {
    algo      = "RSA"
    private   = "teste-gcp-key.pem"
    perm      = "0600"
  }
}

############################################
# VPC
############################################

variable "vpc" {
  description = "Variavel name vpc"
  default     = {
    name      = "teste-vpc"
  }
}

############################################
# SUBNET PUBLIC
############################################

variable "sb_public" {
  description = "Variaveis sb public"
  default     = {
    name      = "teste-sb-public"
    ip        = "192.168.10.0/24"
  }
}

############################################
# FW PUBLIC
############################################

variable "fw_public" {
  description = "Variaveis fw"
  default     = {
    name      = "teste-fw-public"
    icmp      = "icmp"
    tcp       = "tcp"
    http      = "80"
    ssh       = "22"
    rdp       = "3389"
    nfs       = "2049"
    udp       = "udp"
  }
}

############################################
# SQL
############################################

variable "sql" {
  description = "Variaveis sql"
  default     = {
    service   = "sqladmin.googleapis.com"
    name      = "teste-db"
  }
}

variable "postgres" {
  description = "Variaveis postgres"
  default     = {
    name      = "teste-db-instance"
    version   = "POSTGRES_14"
    tier      = "db-f1-micro"
    auth      = "teste-an"
    user      = "teste-user"
    pass      = "123Mudar@@"
  }
}

############################################
# STORAGE
############################################

variable "stg" {
  description = "Variaveis stg"
  default     = {
    name      = "teste-storage-clouding-storage"
    location  = "US"
    class     = "STANDARD"
    role      = "roles/storage.objectViewer"
    entity    = "allUsers"
  }
}

############################################
# VPN
############################################

variable "vpn" {
  description = "Variaveis vpn"
  default     = {
    gw        = "teste-vpn-gw"
    ip        = "teste-vpn-ip"
    tunnel    = "teste-tunnel"
    onprem    = "x.x.x.x"
    onprem_sb = "x.x.x.x/x"
    key       = "##Mudar@@"
    rt_name   = "teste-vpn-rt"
    rt_prio   = 1000
  }
}

variable "vpn_fr" {
  description = "Variaveis vpn fr"
  default     = {
    esp_name  = "teste-fr-esp"
    esp_prot  = "ESP"
    500_name  = "teste-fr-500"
    500_prot  = "UDP"
    500_port  = "500"
    4500_name = "teste-fr-4500"
    4500_prot = "UDP"
    4500_port = "4500"
  }
}
