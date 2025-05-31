############################################
# OUTPUT
############################################

output "vpn_ip" {
  value = google_compute_address.tf_vpn_ip.address
}