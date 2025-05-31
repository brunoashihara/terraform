############################################
# OUTPUT
############################################

output "firestore_id" {
  value = google_firestore_database.tf_firestore.id
}