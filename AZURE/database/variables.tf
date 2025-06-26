############################################
# DATABASE FIREWALL
############################################

variable "azure_dbs_fw" {
  description = "Database Firewall Variables"
  type = object({
    fin = string
    ini = string
  })
}

############################################
# MSSQL
############################################

variable "azure_mssql" {
  description = "MSSQL Variables"
  type = object({
    db_col    = string
    db_lic    = string
    db_name   = string
    db_size   = number
    db_sku    = string
    fw_name   = string
    name      = string
    version   = string
    tls       = string
    retention = number
    sub_name  = string
    email     = list(string)
    upn       = string
  })
}

############################################
# RESOURCE GROUP
############################################

variable "azure_resource_group" {
  description = "Resource group Variables"
  type = object({
    admin  = string
    name   = string
    onprem = string
    pass   = string
    region = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "blob_endpoint" {
  description = "Blob Endpoint"
  type        = string
}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "storage_account_key" {
  description = "Storage Account Key"
  type        = string
}

variable "sb_private_id" {
  description = "Subnet Private ID"
  type        = string
}