############################################
# FILE STORAGE
############################################

resource "oci_file_storage_file_system" "tf_file" {
  availability_domain = var.oci_file.ad
  compartment_id      = var.compartment_id
  display_name        = var.oci_file.name
}

############################################
# MOUNT TARGET
############################################

resource "oci_file_storage_mount_target" "tf_mount" {
  availability_domain = var.oci_mount.ad
  compartment_id      = var.compartment_id
  subnet_id           = var.sb_private_id
  display_name        = var.oci_mount.name
  nsg_ids             = [var.nsg_private_id]
}

############################################
# EXPORT
############################################

resource "oci_file_storage_export" "tf_export" {
  export_set_id  = oci_file_storage_mount_target.tf_mount.export_set_id
  file_system_id = oci_file_storage_file_system.tf_file.id
  path           = var.oci_export.path
}