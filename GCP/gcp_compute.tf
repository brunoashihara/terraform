############################################
# COMPUTE LINUX IP
############################################

resource "google_compute_address" "teste_linux_ip" {
  depends_on = [
    google_project_service.teste_compute_enable
  ]
  name = var.compute.li_ip
}

############################################
# COMPUTE WINDOWS IP
############################################

#resource "google_compute_address" "teste_windows_ip" {
#  depends_on = [
#    google_project_service.teste_compute_enable
#  ]
#  name = var.compute.wi_ip
#}

############################################
# COMPUTE LINUX
############################################

resource "google_compute_instance" "teste_linux" {
  depends_on = [
    google_filestore_instance.teste_filestore
  ]
  name         = var.compute.li_name
  machine_type = var.compute.li_type
  zone         = var.project.zone
  boot_disk {
    initialize_params {
      image = var.compute.li_img
    }
  }
  network_interface {
    network    = google_compute_network.teste_vpc.id
    subnetwork = google_compute_subnetwork.teste_sb_public.id
    access_config {
      nat_ip = google_compute_address.teste_linux_ip.address
    }
  }
  allow_stopping_for_update = true
  metadata = {
    ssh-keys       = "bhka_cloud:${tls_private_key.teste_gcp_key.public_key_openssh} bhka_cloud"
    startup-script = "#!/bin/bash\n\nsudo apt update -y\nsudo apt install nfs-common -y\nsudo mkdir -p /mnt/filestore\nsudo mount -o rw,intr ${google_filestore_instance.teste_filestore.networks.0.ip_addresses.0}:/filestore /mnt/filestore"
  }
}

############################################
# COMPUTE WINDOWS
############################################

#resource "google_compute_instance" "teste_windows" {
#    name = var.compute.wi_name
#    machine_type = var.compute.wi_type
#    zone = var.project.zone
#    boot_disk {
#        initialize_params {
#          image = var.compute.wi_img
#        }
#    }
#    network_interface {
#        network = google_compute_network.teste_vpc.id
#        subnetwork = google_compute_subnetwork.teste_sb_public.id
#        access_config {
#          nat_ip = google_compute_address.teste_windows_ip.address
#        }
#    }
#    allow_stopping_for_update = true
#}
