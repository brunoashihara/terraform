############################################
# DATAS
############################################

data "azurerm_subscription" "primary" {}

############################################
# MULTICLOUD MODULES
############################################

module "aws" {
  source            = "./AWS"
  aws_dynamodb      = var.aws_dynamodb
  aws_ec2           = var.aws_ec2
  aws_efs           = var.aws_efs
  aws_key           = var.aws_key
  aws_nacl_private  = var.aws_nacl_private
  aws_nacl_public   = var.aws_nacl_public
  aws_rds           = var.aws_rds
  aws_region        = var.aws_region
  aws_rt_private    = var.aws_rt_private
  aws_rt_public     = var.aws_rt_public
  aws_s3            = var.aws_s3
  aws_sg_private    = var.aws_sg_private
  aws_sg_public     = var.aws_sg_public
  aws_sb_private    = var.aws_sb_private
  aws_sb_public     = var.aws_sb_public
  aws_sg_public     = var.aws_sg_public
  aws_vpc           = var.aws_vpc
}

module "azure" {
  source          = "./AZURE"
  azure_blob            = var.azure_blob
  azure_container       = var.azure_container
  azure_cosmodb         = var.azure_cosmodb
  azure_dbs_fw          = var.azure_dbs_fw
  azure_dns_zone        = var.azure_dns_zone
  azure_fileshare       = var.azure_fileshare
  azure_key             = var.azure_key
  azure_lng             = var.azure_lng
  azure_mssql           = var.azure_mssql
  azure_mysql           = var.azure_mysql
  azure_network         = var.azure_network
  azure_ni              = var.azure_ni
  azure_nsg_private     = var.azure_nsg_private
  azure_nsg_public      = var.azure_nsg_public
  azure_postgres        = var.azure_postgres
  azure_resource_group  = var.azure_resource_group
  azure_storage         = var.azure_storage
  azure_sb_private      = var.azure_sb_private
  azure_sb_public       = var.azure_sb_public
  azure_sb_vpn          = var.azure_sb_vpn
  azure_vm_linux        = var.azure_vm_linux
  azure_vm_windows      = var.azure_vm_windows
  azure_vn              = var.azure_vn
  azure_vng             = var.azure_vng
  azure_vng_connection  = var.azure_vng_connection
  subscription_id       = data.azurerm_subscription.primary.id
}

module "gcp" {
  source          = "./GCP"
  gcp_compute     = var.gcp_compute
  gcp_filestore   = var.gcp_filestore
  gcp_firestore   = var.gcp_firestore
  gcp_fw_private  = var.gcp_fw_private
  gcp_fw_public   = var.gcp_fw_public
  gcp_gke         = var.gcp_gke
  gcp_key         = var.gcp_key
  gcp_postgres    = var.gcp_postgres
  gcp_project     = var.gcp_project
  gcp_sql         = var.gcp_sql
  gcp_storage     = var.gcp_storage
  gcp_sb_private  = var.gcp_sb_private
  gcp_sb_public   = var.gcp_sb_public
  gcp_vpc         = var.gcp_vpc
  gcp_vpn         = var.gcp_vpn
  gcp_vpn_fr      = var.gcp_vpn_fr
}

module "oci" {
  source            = "./OCI"
  oci_autonomousdb  = var.oci_autonomousdb
  oci_bucket        = var.oci_bucket
  oci_cpe           = var.oci_cpe
  oci_compartment   = var.oci_compartment
  oci_compute       = var.oci_compute
  oci_drg           = var.oci_drg
  oci_drg_attach    = var.oci_drg_attach
  oci_export        = var.oci_export
  oci_file          = var.oci_file
  oci_igw           = var.oci_igw
  oci_ipsec         = var.oci_ipsec
  oci_key           = var.oci_key
  oci_mount         = var.oci_mount
  oci_nsg_private   = var.oci_nsg_private
  oci_nsg_public    = var.oci_nsg_public
  oci_rt_private    = var.oci_rt_private
  oci_rt_public     = var.oci_rt_public
  oci_sb_private    = var.oci_sb_private
  oci_sb_public     = var.oci_sb_public
  oci_vcn           = var.oci_vcn
}