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
  })
}

############################################
# MYSQL
############################################

variable "azure_mysql" {
  description = "MySQL Variables"
  type = object({
    db_char   = string
    db_col    = string
    db_name   = string
    fw_name   = string
    name      = string
    sku       = string
    stg       = number
    tls       = string
    version   = string
  })
}

############################################
# POSTGRES
############################################

variable "azure_postgres" {
  description = "Postgres Variables"
  type = object({
    db_char   = string
    db_col    = string
    db_name   = string
    fw_name   = string
    name      = string
    sku       = string
    ssl       = string
    stg       = number
    version   = string
  })
}

############################################
# RESOURCE GROUP
############################################

variable "azure_resource_group" {
  description = "Resource group Variables"
  type = object({
    admin   = string
    name    = string
    onprem  = string
    pass    = string
    region  = string
  })
}

############################################
# OUTPUT VARIABLES
############################################

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}