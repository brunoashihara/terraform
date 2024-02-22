############################################
# INSTANCE LINUX
############################################

resource "oci_core_instance" "oci01" {
  availability_domain = var.compartment.ad
  compartment_id      = oci_identity_compartment.compartment.id
  shape               = var.instance.shape.name
  display_name        = var.instance.name

  source_details {
    source_id   = var.instance.img
    source_type = var.instance.source_type
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.sb_public.id
    assign_public_ip = var.instance.public
    nsg_ids          = [oci_core_network_security_group.nsg.id]
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.tf_key.public_key_openssh
    user_data           = #!/bin/bash\n\nyum install nfs-utils -y\nmkdir -p /mnt/export\nsudo mount ${oci_file_storage_mount_target.mount.private_ip_ids}:/export /mnt/export"
  }
}