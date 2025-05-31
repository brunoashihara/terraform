############################################
# FIRESTORE
############################################

resource "google_firestore_database" "tf_firestore" {
  project                     = var.project_id
  name                        = var.gcp_firestore.name
  type                        = var.gcp_firestore.type
  location_id                 = var.gcp_firestore.location
  concurrency_mode            = var.gcp_firestore.concur
  app_engine_integration_mode = var.gcp_firestore.engine
}