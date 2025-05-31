############################################
# OUTPUT
############################################

output "gke_ip" {
  value = google_container_cluster.tf_gke.endpoint
}
