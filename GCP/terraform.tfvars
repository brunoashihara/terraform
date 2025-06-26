############################################
# COMPUTE
############################################

gcp_compute = {
  li_img  = "debian-cloud/debian-12"
  li_ip   = "tf-linux-ip"
  li_name = "gcp01"
  li_type = "e2-micro"
  size    = 30
  tags    = ["public"]
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
  cap      = 1024
  name     = "tf-filestore"
  network  = "MODE_IPV4"
  share    = "filestore"
  tier     = "BASIC_HDD"
  ip_range = "10.200.82.0/29"
}

############################################
# FIRESTORE
############################################

gcp_firestore = {
  concur   = "OPTIMISTIC"
  engine   = "DISABLED"
  location = "nam5"
  name     = "(default)"
  type     = "FIRESTORE_NATIVE"
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
    target_tags   = ["public"]
  },
  {
    name          = "allow-http"
    protocol      = "tcp"
    ports         = ["80"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["public"]
  },
  {
    name          = "allow-https"
    protocol      = "tcp"
    ports         = ["443"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["public"]
  },
  {
    name          = "allow-ssh"
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["public"]
  },
  {
    name          = "allow-rdp"
    protocol      = "tcp"
    ports         = ["3389"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["public"]
  }
]

############################################
# GOOGLE KUBERNETES ENGINE
############################################

gcp_gke = {
  count     = 1
  name      = "tf-gke"
  oauth     = "https://www.googleapis.com/auth/cloud-platform"
  labels    = { environment = "training" }
  tags      = ["environment", "training"]
  to_create = "30m"
  to_update = "40m"
  enable    = true
  disable   = false
  cidr      = "172.16.0.0/28"
  auth_name = "internal-access"
  metadata  = "GKE_METADATA"
  provider  = "CALICO"
  binary    = "PROJECT_SINGLETON_POLICY_ENFORCE"
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
# POSTGRES
############################################

gcp_postgres = {
  name    = "tf-db-instance"
  version = "POSTGRES_17"
  tier    = "db-f1-micro"
  enable  = true
  disable = false
  time    = "02:00"
  backup  = 7
  unit    = "COUNT"
  auth    = "tf-an"
  pass    = "trocarsenha"
  user    = "tf-user"
}

############################################
# PROJECT
############################################

gcp_project = {
  name   = "gcp-tf-gce-gcs-labs"
  region = "us-central1"
  zone   = "us-central1-c"
}

############################################
# SQL
############################################

gcp_sql = {
  name = "tf-db"
}

############################################
# STORAGE
############################################

gcp_storage = {
  class    = "STANDARD"
  entity   = "allUsers"
  location = "US"
  name     = "tf-storage-clouding-storage"
  role     = "roles/storage.objectViewer"
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
  onprem    = "0.0.0.0/0"
  onprem_sb = "10.25.1.0/24"
  local     = "10.200.80.0/22"
  remote    = "10.25.1.0/24"
  rt_name   = "tf-vpn-rt"
  rt_prio   = 1000
  tunnel    = "tf-tunnel"
}

############################################
# VPN FORWARD RULE
############################################

gcp_vpn_fr = {
  name_4500 = "tf-fr-4500"
  port_4500 = "4500"
  prot_4500 = "UDP"
  name_500  = "tf-fr-500"
  port_500  = "500"
  prot_500  = "UDP"
  esp_name  = "tf-fr-esp"
  esp_prot  = "ESP"
}