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

output "vpc_network_self_link" {
  value = google_compute_network.tf_vpc.self_link
}

output "private_subnet_cidr" {
  value = google_compute_subnetwork.tf_sb_public.ip_cidr_range
}