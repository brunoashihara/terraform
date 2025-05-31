############################################
# OUTPUT
############################################

output "linux_ip" {
  value = google_compute_instance.gcp01.network_interface[0].access_config[0].nat_ip
}

#output "windows_ip" {
#  value = google_compute_instance.gcp02.network_interface[0].access_config[0].nat_ip
#}