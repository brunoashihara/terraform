############################################
# OUTPUT
############################################

output "mount_ip" {
  value = oci_file_storage_mount_target.tf_mount.ip_address
}