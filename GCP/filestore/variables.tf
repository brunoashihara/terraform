############################################
# FILESTORE
############################################

variable "gcp_filestore" {
  description = "Filestore Variables"
  type = object ({
    cap       = number
    name      = string
    network   = string
    share     = string
    tier      = string
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