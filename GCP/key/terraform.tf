############################################
# TERRAFORM
############################################

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.3"
    }
  }
}
