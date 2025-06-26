############################################
# TERRAFORM
############################################

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.40"
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

provider "google" {
  project = "teste-gcp-terraform-teste" # projeto existente (pai)
  region  = var.gcp_project.region
  zone    = var.gcp_project.zone
}

############################################
# TFSTATE
############################################

#terraform {
#  backend "gcs" {
#    bucket = "tf-gcs-bucket-brunoashihara"  # Nome do seu bucket no GCS
#    prefix = "TFSTATE/terraform.tfstate"  # Caminho virtual para o arquivo tfstate
#  }
#}