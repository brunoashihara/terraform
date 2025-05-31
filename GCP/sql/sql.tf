############################################
# SQL
############################################

resource "google_sql_database" "tf_db" {
  project   = var.project_id
  name      = var.gcp_sql.name
  instance  = google_sql_database_instance.tf_db_instance.name
}

############################################
# POSTGRES
############################################

resource "google_sql_database_instance" "tf_db_instance" {
  project          = var.project_id
  name             = var.gcp_postgres.name
  region           = var.gcp_project.region
  database_version = var.gcp_postgres.version
  settings {
    tier = var.gcp_postgres.tier
    ip_configuration {
      authorized_networks {
        name  = var.gcp_postgres.auth
        value = var.gcp_project.coringa
      }
    }
  }
  deletion_protection = false
}

############################################
# POSTGRES USER
############################################

resource "google_sql_user" "tf_user" {
  project  = var.project_id
  name     = var.gcp_postgres.user
  instance = google_sql_database_instance.tf_db_instance.name
  password = var.gcp_postgres.pass
}