############################################
# PROJECT
############################################

resource "google_project" "tf_project" {
  # checkov:skip=CKV2_GCP_5: Doesnt need the Audit Logs in this project
  name                = var.gcp_project.name
  project_id          = var.gcp_project.name
  auto_create_network = false
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