############################################
# PROJECT
############################################

resource "google_project" "tf_project" {
  name            = var.gcp_project.name
  project_id      = var.gcp_project.name
  # Provisioner para destruir o projeto com o gcloud quando o recurso for destruído
  provisioner "local-exec" {
    when    = destroy
    command = "gcloud projects delete ${self.project_id} --quiet"
  }
}

############################################
# API
############################################

resource "google_project_service" "enable_apis" {
  for_each = toset([
    "compute.googleapis.com",
    "storage.googleapis.com",
    "file.googleapis.com",
    "firestore.googleapis.com",
    "container.googleapis.com",
    "sqladmin.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ])
  project            = google_project.tf_project.project_id
  service            = each.value
  disable_on_destroy = true
}