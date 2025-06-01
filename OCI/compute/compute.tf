############################################
# INSTANCE LINUX
############################################

resource "oci_core_instance" "oci01" {
  availability_domain = var.oci_compute.ad
  compartment_id      = var.compartment_id
  shape               = var.oci_compute.shape.name
  display_name        = var.oci_compute.name

  source_details {
    source_id   = var.oci_compute.img
    source_type = var.oci_compute.source_type
  }

  create_vnic_details {
    subnet_id        = var.sb_public_id
    assign_public_ip = var.oci_compute.public
    nsg_ids          = [var.nsg_public_id]
  }

  metadata = {
    ssh_authorized_keys = var.public_key_openssh
  }

  connection {
    type        = var.oci_compute.type
    host        = self.public_ip
    user        = var.oci_compute.user
    private_key = var.private_key
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nfs-utils -y",
      "sudo mkdir -p /mnt/export",
      "sudo mount ${var.mount_ip}:/export /mnt/export"
    ]
  }
}