############################################
# TERRAFORM
############################################

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.33.0"
    }
    azuread = {
      source  = "hashicorp/azurerm"
      version = "~> 3.4.0"
    }
  }
}