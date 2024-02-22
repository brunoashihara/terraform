############################################
# FILE STORAGE
############################################

resource "oci_file_storage_file_system" "file" {
  availability_domain = var.compartment.ad
  compartment_id      = oci_identity_compartment.compartment.id
  display_name        = var.file.name
}

############################################
# MOUNT TARGET
############################################

resource "oci_file_storage_mount_target" "mount" {
  availability_domain = var.compartment.ad
  compartment_id      = oci_identity_compartment.compartment.id
  subnet_id           = oci_core_subnet.sb_public.id
  display_name        = var.mount.name
  nsg_ids             = [oci_core_network_security_group.nsg.id]
}

############################################
# EXPORT
############################################

resource "oci_file_storage_export" "export" {
  export_set_id  = oci_file_storage_mount_target.mount.export_set_id
  file_system_id = oci_file_storage_file_system.file.id
  path           = var.export.path
}