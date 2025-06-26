############################################
# terraform
############################################

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.5.0"
    }
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

############################################
# PROVIDER
############################################

provider "oci" {
  config_file_profile = "DEFAULT"
}