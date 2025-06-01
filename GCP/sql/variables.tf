############################################
# POSTGRES
############################################

variable "gcp_postgres" {
  description = "Postgres Variables"
  type = object({
    auth      = string
    name      = string
    pass      = string
    tier      = string
    user      = string
    version   = string
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
# SQL
############################################

variable "gcp_sql" {
  description = "SQL Variables"
  type = object({
    name      = string
  })
}

############################################
# OUTPUTS VARIABLES
############################################

variable "project_id" {
  description = "Project ID"
  type        = string
}