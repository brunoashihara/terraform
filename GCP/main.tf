############################################
# TERRAFORM
############################################

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

############################################
# PROVIDER
############################################

provider "google" {
  project       = "teste-gcp-terraform-teste"  # projeto existente (pai)
  region        = var.gcp_project.region
  zone          = var.gcp_project.zone
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