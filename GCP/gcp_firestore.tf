############################################
# FIRESTORE
############################################

resource "google_firestore_database" "teste_firestore" {
  project                     = var.project.name
  name                        = var.firestore.name
  type                        = var.firestore.type
  location_id                 = var.firestore.location
  concurrency_mode            = var.firestore.concur
  app_engine_integration_mode = var.firestore.engine
  depends_on = [
    google_project_service.teste_firestore_enable
  ]
}