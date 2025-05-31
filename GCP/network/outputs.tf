############################################
# OUTPUT
############################################

output "vpc_id" {
  value = google_compute_network.tf_vpc.id
}

output "sb_private_id" {
  value = google_compute_subnetwork.tf_sb_public.id
}

output "sb_public_id" {
  value = google_compute_subnetwork.tf_sb_public.id
}