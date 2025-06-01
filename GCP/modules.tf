############################################
# COMPUTE
############################################

module "gcp_compute" {
    source              = "./compute"
    gcp_compute         = var.gcp_compute
    gcp_project         = var.gcp_project
    filestore_ip        = module.gcp_filestore.filestore_ip
    project_id          = module.gcp_project.project_id
    public_key_openssh  = module.gcp_key.public_key_openssh
    sb_public_id        = module.gcp_network.sb_public_id
    vpc_id              = module.gcp_network.vpc_id
    depends_on          = [module.gcp_filestore,module.gcp_key,module.gcp_network,module.gcp_project]
}

############################################
# FILESTORE
############################################

module "gcp_filestore" {
    source          = "./filestore"
    gcp_filestore   = var.gcp_filestore
    project_id      = module.gcp_project.project_id
    vpc_id          = module.gcp_network.vpc_id
    depends_on      = [module.gcp_network,module.gcp_project]
}

############################################
# FIRESTORE
############################################

module "gcp_firestore" {
    source          = "./firestore"
    gcp_firestore   = var.gcp_firestore
    project_id      = module.gcp_project.project_id
    depends_on      = [module.gcp_project]
}

############################################
# FIREWALL
############################################

module "gcp_firewall" {
  source                = "./firewall"
  gcp_fw_private        = var.gcp_fw_private
  gcp_fw_public         = var.gcp_fw_public
  project_id            = module.gcp_project.project_id
  vpc_id                = module.gcp_network.vpc_id
  depends_on            = [module.gcp_project,module.gcp_network]
}


############################################
# Google Kubernetes Engine
############################################

module "gcp_gke" {
    source          = "./gke"
    gcp_gke         = var.gcp_gke
    gcp_project     = var.gcp_project
    project_id      = module.gcp_project.project_id
    sb_public_id    = module.gcp_network.sb_public_id
    vpc_id          = module.gcp_network.vpc_id
    depends_on      = [module.gcp_network,module.gcp_project]
}

############################################
# KEY
############################################

module "gcp_key" {
    source        = "./key"
    gcp_key       = var.gcp_key
    depends_on    = [module.gcp_project]
}

############################################
# NETWORK
############################################

module "gcp_network" {
    source              = "./network"
    gcp_project         = var.gcp_project
    gcp_sb_private      = var.gcp_sb_private
    gcp_sb_public       = var.gcp_sb_public
    gcp_vpc             = var.gcp_vpc
    project_id          = module.gcp_project.project_id
    depends_on          = [module.gcp_project]
}

############################################
# PROJECT
############################################

module "gcp_project"{
    source      = "./project"
    gcp_project = var.gcp_project
}

############################################
# SQL
############################################

module "gcp_sql"{
    source      = "./sql"
    gcp_project = var.gcp_project
    gcp_sql     = var.gcp_sql
    project_id  = module.gcp_project.project_id
    depends_on  = [module.gcp_project]
}

############################################
# STORAGE
############################################

module "gcp_storage" {
    source          = "./storage"
    gcp_storage     = var.gcp_storage
    project_id      = module.gcp_project.project_id
    depends_on      = [module.gcp_project]
}

############################################
# VPN
############################################

module "gcp_vpn"{
    source      = "./vpn"
    gcp_project = var.gcp_project
    gcp_vpc     = var.gcp_vpc
    gcp_vpn     = var.gcp_vpn
    project_id  = module.gcp_project.project_id
    vpc_id      = module.gcp_network.vpc_id
    depends_on  = [module.gcp_network,module.gcp_project]
}