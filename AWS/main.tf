############################################
# TERRAFORM
############################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

############################################
# PROVIDER
############################################

provider "aws" {
  region = var.region.name
}