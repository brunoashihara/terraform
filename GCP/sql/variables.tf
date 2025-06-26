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
# SQL
############################################

variable "gcp_sql" {
  description = "SQL Variables"
  type = object({
    name = string
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

variable "vpc_link" {
  description = "VPC Link"
  type        = string
}