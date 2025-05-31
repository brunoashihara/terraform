############################################
# COMPUTE
############################################

gcp_compute = {
  li_img  = "debian-cloud/debian-12"
  li_ip   = "tf-linux-ip"
  li_name = "gcp01"
  li_type = "e2-micro"
  size    = 30
  type    = "pd-standard"
  wi_img  = "windows-cloud/windows-server-2022-dc-v20230712" 
  wi_ip   = "tf-windows-ip"
  wi_name = "gcp02"
  wi_type = "e2-micro"
}

############################################
# FILESTORE
############################################

gcp_filestore = {
  cap       = 1024
  name      = "tf-filestore"
  network   = "MODE_IPV4"
  share     = "filestore"
  tier      = "BASIC_HDD"
}

############################################
# FIRESTORE
############################################

gcp_firestore = {
  concur    = "OPTIMISTIC"
  engine    = "DISABLED"
  location  = "nam5"
  name      = "(default)"
  type      = "FIRESTORE_NATIVE"
}

############################################
# FIREWALL PRIVATE
############################################

gcp_fw_private = [
  {
    name          = "allow-internal-all"
    protocol      = "all"
    ports         = []
    source_ranges = ["10.200.80.0/22"]
  }
]


############################################
# FIREWALL PUBLIC
############################################

gcp_fw_public = [
  {
    name          = "allow-icmp"
    protocol      = "icmp"
    ports         = []
    source_ranges = ["0.0.0.0/0"]
  },
  {
    name          = "allow-http"
    protocol      = "tcp"
    ports         = ["80"]
    source_ranges = ["0.0.0.0/0"]
  },
  {
    name          = "allow-https"
    protocol      = "tcp"
    ports         = ["443"]
    source_ranges = ["0.0.0.0/0"]
  },
  {
    name          = "allow-ssh"
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
  },
  {
    name          = "allow-rdp"
    protocol      = "tcp"
    ports         = ["3389"]
    source_ranges = ["0.0.0.0/0"]
  }
]

############################################
# GOOGLE KUBERNETES ENGINE
############################################

gcp_gke = {
  count     = 1
  name      = "tf-gke"
  oauth     = "https://www.googleapis.com/auth/cloud-platform"
  tags      = ["environment", "training"]
  to_create = "30m"
  to_update = "40m"
}

############################################
# KEY
############################################

gcp_key = {
  algo    = "RSA"
  perm    = "0600"
  private = "gcp.pem"
  rsa     = 4096
}

############################################
# PROJECT
############################################

gcp_project = {
  coringa = "0.0.0.0/0"
  name    = "gcp-tf-gce-gcs-labs"
  region  = "us-central1"
  zone    = "us-central1-c"
}

############################################
# SQL
############################################

gcp_postgres = {
  auth      = "tf-an"
  name      = "tf-db-instance"
  pass      = "trocarsenha"
  tier      = "db-f1-micro"
  user      = "tf-user"
  version   = "POSTGRES_14"
}

gcp_sql = {
  name      = "tf-db"
}

############################################
# STORAGE
############################################

gcp_storage = {
  class     = "STANDARD"
  entity    = "allUsers"
  location  = "US"
  name      = "tf-storage-clouding-storage"
  role      = "roles/storage.objectViewer"
}

############################################
# SUBNET PRIVATE
############################################

gcp_sb_private = {
  ip   = "10.200.80.0/24"
  name = "tf-sb-private"
}

############################################
# SUBNET PUBLIC
############################################

gcp_sb_public = {
  ip   = "10.200.81.0/24"
  name = "tf-sb-public"
}

############################################
# VPC
############################################

gcp_vpc = {
  name = "tf-vpc"
}

############################################
# VPN
############################################

gcp_vpn = {
  gw        = "tf-vpn-gw"
  ip        = "tf-vpn-ip"
  key       = "trocarsenha"
  onprem    = "x.x.x.x"
  onprem_sb = "x.x.x.x/x"
  rt_name   = "tf-vpn-rt"
  rt_prio   = 1000
  tunnel    = "tf-tunnel"
}

gcp_vpn_fr = {
  4500_name = "tf-fr-4500"
  4500_port = "4500"
  4500_prot = "UDP"
  500_name  = "tf-fr-500"
  500_port  = "500"
  500_prot  = "UDP"
  esp_name  = "tf-fr-esp"
  esp_prot  = "ESP"
}