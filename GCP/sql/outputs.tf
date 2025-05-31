############################################
# OUTPUT
############################################

output "sql_ip" {
  value = google_sql_database_instance.tf_db_instance.public_ip_address
}