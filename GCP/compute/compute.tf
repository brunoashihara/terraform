############################################
# COMPUTE LINUX IP
############################################

resource "google_compute_address" "tf_linux_ip" {
  project = var.project_id
  name    = var.gcp_compute.li_ip
}

############################################
# COMPUTE WINDOWS IP
############################################

#resource "google_compute_address" "tf_windows_ip" {
#  project  = var.project_id
#  name     = var.gcp_compute.wi_ip
#}

############################################
# COMPUTE LINUX
############################################

resource "google_compute_instance" "gcp01" {
  project      = var.project_id
  name         = var.gcp_compute.li_name
  machine_type = var.gcp_compute.li_type
  zone         = var.gcp_project.zone
  boot_disk {
    initialize_params {
      image = var.gcp_compute.li_img
    }
  }
  network_interface {
    network    = var.vpc_id
    subnetwork = var.sb_public_id
    access_config {
      nat_ip = google_compute_address.tf_linux_ip.address
    }
  }
  allow_stopping_for_update = true
  metadata = {
    ssh-keys       = "bhka_cloud:${var.public_key_openssh} bhka_cloud"
    startup-script = "#!/bin/bash\n\nsudo apt update -y\nsudo apt install nfs-common -y\nsudo mkdir -p /mnt/filestore\nsudo mount -o rw,intr ${var.filestore_ip}:/filestore /mnt/filestore"
  }
}

############################################
# COMPUTE WINDOWS
############################################

#resource "google_compute_instance" "gcp02" {
#    project      = var.project_id
#    name = var.gcp_compute.wi_name
#    machine_type = var.gcp_compute.wi_type
#    zone = var.gcp_project.zone
#    boot_disk {
#        initialize_params {
#          image = var.gcp_compute.wi_img
#        }
#    }
#    network_interface {
#        network = var.vpc_id
#        subnetwork = var.sb_public_id
#        access_config {
#          nat_ip = google_compute_address.tf_windows_ip.address
#        }
#    }
#    allow_stopping_for_update = true
#}
