############################################
# OUTPUT
############################################

output "linux_ip" {
  value = oci_core_instance.oci01.public_ip
}
