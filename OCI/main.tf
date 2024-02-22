############################################
# terraform
############################################
terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "5.23.0"
    }
  }

}

############################################
# PROVIDER
############################################

provider "oci" {
  config_file_profile = "DEFAULT"
}