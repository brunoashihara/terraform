############################################
# SQL
############################################

resource "google_sql_database" "teste_db" {
  name     = var.sql.name
  instance = google_sql_database_instance.teste_db_instance.name
}

############################################
# POSTGRES
############################################

resource "google_sql_database_instance" "teste_db_instance" {
  depends_on = [
    google_project_service.teste_sql_enable
  ]
  name             = var.postgres.name
  region           = var.project.region
  database_version = var.postgres.version
  settings {
    tier = var.postgres.tier
    ip_configuration {
      authorized_networks {
        name  = var.postgres.auth
        value = var.project.coringa
      }
    }
  }
  deletion_protection = false
}

############################################
# POSTGRES USER
############################################

resource "google_sql_user" "teste_user" {
  name     = var.postgres.user
  instance = google_sql_database_instance.teste_db_instance.name
  password = var.postgres.pass
}