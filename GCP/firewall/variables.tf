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
  }))
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