############################################
# TERRAFORM
############################################

terraform {
  required_providers {
    google = {
      version = "~>4.69.1"
    }
  }
}

############################################
# PROVIDER
############################################

provider "google" {
  project = var.project.name #nome do projeto
  region  = var.project.region
  zone    = var.project.zone
}

############################################
# CRM
############################################

resource "google_project_service" "teste_cloud_enable" {
  project            = var.project.name
  service            = var.project.service
  disable_on_destroy = false
}

############################################
# COMPUTE
############################################

resource "google_project_service" "teste_compute_enable" {
  project            = var.project.name
  service            = var.compute.service
  disable_on_destroy = false
  depends_on = [
    google_project_service.teste_cloud_enable
  ]
}

############################################
# SQL
############################################

resource "google_project_service" "teste_sql_enable" {
  project            = var.project.name
  service            = var.sql.service
  disable_on_destroy = false
  depends_on = [
    google_project_service.teste_compute_enable
  ]
}


############################################
# FILESTORE
############################################

resource "google_project_service" "teste_filestore_enable" {
  project            = var.project.name
  service            = var.filestore.service
  disable_on_destroy = false
  depends_on = [
    google_project_service.teste_sql_enable
  ]
}

############################################
# K8E
############################################

resource "google_project_service" "teste_k8e_enable" {
  project            = var.project.name
  service            = var.k8e.service
  disable_on_destroy = false
  depends_on = [
    google_project_service.teste_filestore_enable
  ]
}

############################################
# FIRESTORE
############################################

resource "google_project_service" "teste_firestore_enable" {
  project            = var.project.name
  service            = var.firestore.service
  disable_on_destroy = false
  depends_on = [
    google_project_service.teste_k8e_enable
  ]
}
