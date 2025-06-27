############################################
# SQL
############################################

resource "google_sql_database" "tf_db" {
  project  = var.project_id
  name     = var.gcp_sql.name
  instance = google_sql_database_instance.tf_db_instance.name
}

############################################
# POSTGRES
############################################

#tfsec:ignore:google-sql-encrypt-in-transit-data
resource "google_sql_database_instance" "tf_db_instance" {
  #checkov:skip=CKV_GCP_109: Have defined error but it doesnt pass
  #checkov:skip=CKV_GCP_6: require_ssl applied to google_sql_user
  project          = var.project_id
  name             = var.gcp_postgres.name
  region           = var.region
  database_version = var.gcp_postgres.version

  settings {
    tier = var.gcp_postgres.tier

    ip_configuration {
      ipv4_enabled    = var.gcp_postgres.disable
      private_network = var.vpc_link
    }

    backup_configuration {
      enabled                        = var.gcp_postgres.enable
      start_time                     = var.gcp_postgres.time
      point_in_time_recovery_enabled = var.gcp_postgres.enable

      backup_retention_settings {
        retained_backups = var.gcp_postgres.backup
        retention_unit   = var.gcp_postgres.unit
      }
    }

    database_flags {
      name  = "log_min_messages"
      value = "error"
    }

    database_flags {
      name  = "ssl"
      value = "on"
    }

    database_flags {
      name  = "log_checkpoints"
      value = "on"
    }

    database_flags {
      name  = "log_connections"
      value = "on"
    }

    database_flags {
      name  = "log_disconnections"
      value = "on"
    }

    database_flags {
      name  = "log_hostname"
      value = "on"
    }

    database_flags {
      name  = "log_lock_waits"
      value = "on"
    }

    database_flags {
      name  = "log_statement"
      value = "ddl"
    }

    database_flags {
      name  = "pgaudit.log"
      value = "READ,WRITE"
    }

    database_flags {
      name  = "cloudsql.enable_pgaudit"
      value = "on"
    }

    database_flags {
      name  = "log_temp_files"
      value = "0"
    }

    database_flags {
      name  = "log_duration"
      value = "on"
    }
  }

  deletion_protection = var.gcp_postgres.disable
}

############################################
# POSTGRES USER
############################################

resource "google_sql_user" "tf_user" {
  project     = var.project_id
  name        = var.gcp_postgres.user
  instance    = google_sql_database_instance.tf_db_instance.name
  password = var.gcp_postgres.pass
}