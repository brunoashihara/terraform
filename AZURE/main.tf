############################################
# TERRAFORM
############################################


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

############################################
# PROVIDER
############################################

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

############################################
# RESOURCE GROUP
############################################

resource "azurerm_resource_group" "teste_rg" {
  name     = var.rg.name
  location = var.rg.region
}