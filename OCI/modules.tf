############################################
# AUTONOMOU DATABASE
############################################

module "oci_autonomousdb" {
    source              = "./autonomousdb"
    oci_autonomousdb    = var.oci_autonomousdb
    compartment_id      = module.oci_compartment.compartment_id
    depends_on          = [module.oci_compartment]
}

############################################
# BUCKET
############################################

module "oci_bucket" {
    source              = "./bucket"
    oci_bucket          = var.oci_bucket
    compartment_id      = module.oci_compartment.compartment_id
    depends_on          = [module.oci_compartment]
}


############################################
# COMPARTMENT
############################################

module "oci_compartment"{
    source          = "./compartment"
    oci_compartment = var.oci_compartment
}

############################################
# COMPUTE
############################################

module "oci_compute" {
    source              = "./compute"
    oci_compute         = var.oci_compute
    compartment_id      = module.oci_compartment.compartment_id
    mount_ip            = module.oci_file.mount_ip
    nsg_public_id       = module.oci_network.nsg_public_id
    private_key         = module.oci_key.private_key
    public_key_openssh  = module.oci_key.public_key_openssh
    sb_public_id        = module.oci_network.sb_public_id
    depends_on          = [module.oci_compartment,module.oci_file,module.oci_network,module.oci_key]
}

############################################
# FILE STORAGE
############################################

module "oci_file" {
    source          = "./file"
    oci_export      = var.oci_export
    oci_file        = var.oci_file
    oci_mount       = var.oci_mount
    compartment_id  = module.oci_compartment.compartment_id
    nsg_private_id  = module.oci_nsg.nsg_private_id
    sb_private_id   = module.oci_network.sb_private_id
    depends_on      = [module.oci_compartment,module.oci_network,module.oci_nsg]
}

############################################
# KEY
############################################

module "oci_key" {
    source          = "./key"
    oci_key         = var.oci_key
    depends_on      = [module.oci_compartment]
}

############################################
# NETWORK
############################################

module "oci_network" {
    source              = "./network"
    oci_igw             = var.oci_igw
    oci_sb_private      = var.oci_sb_private
    oci_sb_public       = var.oci_sb_public
    oci_vcn             = var.oci_vcn
    compartment_id      = module.oci_compartment.compartment_id
    depends_on          = [module.oci_compartment]
}

############################################
# NETWORK SECURITY GROUP
############################################

module "oci_nsg" {
  source          = "./nsg"
  oci_nsg_private = var.oci_nsg_private
  oci_nsg_public  = var.oci_nsg_public
  compartment_id  = module.oci_compartment.compartment_id
  vcn_id          = module.oci_network.vcn_id
  depends_on      = [module.oci_compartment,module.oci_network]
}

############################################
# ROUTE TABLE
############################################

locals {
  oci_rt_targets = {
    igw = module.oci_network.igw_id
    drg = module.oci_vpn.drg_id
  }

  oci_rt_public_rules = [
    for rule in var.oci_rt_public.rules : {
      cidr        = rule.cidr
      description = rule.description
      target_id   = lookup(local.oci_rt_targets, rule.target, null)
    }
  ]
}

module "oci_route_table" {
  source          = "./route_table"
  oci_rt_private  = var.oci_rt_private
  oci_rt_public   = {
    name  = var.oci_rt_public.name
    rules = local.oci_rt_public_rules
  }
  compartment_id  = module.oci_compartment.compartment_id
  drg_id         = module.oci_vpn.drg_id
  igw_id         = module.oci_network.igw_id
  sb_private_id   = module.oci_network.sb_private_id
  sb_public_id    = module.oci_network.sb_public_id
  vcn_id          = module.oci_network.vcn_id
  depends_on      = [module.oci_compartment,module.oci_network,module.oci_vpn]
}

############################################
# VPN
############################################

module "oci_vpn" {
    source          = "./vpn"
    oci_cpe         = var.oci_cpe
    oci_drg         = var.oci_drg
    oci_drg_attach  = var.oci_drg_attach
    oci_ipsec       = var.oci_ipsec
    compartment_id  = module.oci_compartment.compartment_id
    vcn_id          = module.oci_network.vcn_id
    depends_on      = [module.oci_compartment,module.oci_network]
}