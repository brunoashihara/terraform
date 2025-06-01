############################################
# BLOB
############################################

module "azure_blob" {
    source                  = "./blob"
    azure_blob              = var.azure_blob
    storage_account_name    = module.azure_storage.storage_account_name
    depends_on              = [module.azure_resource_group,module.azure_storage]
}

############################################
# CONTAINER
############################################

module "azure_container" {
    source                  = "./container"
    azure_container         = var.azure_container
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# COSMODB
############################################

module "azure_cosmodb" {
    source                  = "./cosmodb"
    azure_cosmodb           = var.azure_cosmodb
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# DATABASE
############################################

module "azure_database" {
    source                  = "./database"
    azure_dbs_fw            = var.azure_dbs_fw
    azure_mssql             = var.azure_mssql
    azure_mysql             = var.azure_mysql
    azure_postgres          = var.azure_postgres
    azure_resource_group    = var.azure_resource_group
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# DNS ZONE PRIVATE
############################################

module "azure_dns_zone" {
    source                  = "./dns_zone"
    azure_dns_zone          = var.azure_dns_zone
    virtual_network_id      = module.azure_network.virtual_network_id
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_network,module.azure_resource_group]
}

############################################
# FILESHARE
############################################

module "azure_fileshare" {
    source                  = "./fileshare"
    azure_fileshare         = var.azure_fileshare
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    sb_private_id           = module.azure_network.sb_private_id
    storage_account_id      = module.azure_storage.storage_account_id
    storage_account_name    = module.azure_storage.storage_account_name
    depends_on              = [module.azure_resource_group,module.azure_storage]
}

############################################
# KEY
############################################

module "azure_key" {
    source                  = "./key"
    azure_key               = var.azure_key
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# NETWORK
############################################

module "azure_network" {
    source                  = "./network"
    azure_network           = var.azure_network
    azure_sb_private        = var.azure_sb_private
    azure_sb_public         = var.azure_sb_public
    azure_vn                = var.azure_vn
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# NETWORK SECURITY GROUP
############################################

module "azure_nsg" {
    source                  = "./nsg"
    azure_sg_private        = var.azure_sg_private
    azure_sg_public         = var.azure_sg_public
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    sb_private_id           = module.azure_network.sb_private_id
    sb_public_id            = module.azure_network.sb_public_id
    depends_on              = [module.azure_network,module.azure_resource_group]
}


############################################
# RESOURCE GROUP
############################################

module "azure_resource_group" {
    source                  = "./resource_group"
    azure_resource_group    = var.azure_resource_group
}

############################################
# STORAGE ACCOUNT
############################################

module "azure_storage" {
    source                  = "./storage"
    azure_storage           = var.storage
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    depends_on              = [module.azure_resource_group]
}

############################################
# VIRTUAL MACHINE
############################################

module "azure_vm" {
    source                      = "./vm"
    azure_ni                    = var.azure_ni
    azure_resource_group        = var.azure_resource_group
    azure_vm_linux              = var.azure_vm_linux
    azure_vm_windows            = var.azure_vm_windows
    linux_public_ip_id          = module.azure_network.linux_public_ip_id
    private_key_pem             = module.azure_key.private_key_pem
    public_key_openssh          = module.azure_key.public_key_openssh
    resource_group_location     = module.azure_resource_group.resource_group_location
    resource_group_name         = module.azure_resource_group.resource_group_name
    sb_public_id                = module.azure_network.sb_public_id
    storage_account_key         = module.azure_storage.storage_account_key
    storage_account_name        = module.azure_storage.storage_account_name
    windows_public_ip_id        = module.azure_network.windows_public_ip_id
    depends_on                  = [module.azure_fileshare,module.azure_key,module.azure_network,module.azure_resource_group,module.azure_storage]
}

############################################
# VPN
############################################

module "azure_vpn" {
    source                  = "./vpn"
    azure_lng               = var.azure_lng
    azure_network           = var.azure_network
    azure_resource_group    = var.azure_resource_group
    azure_vng               = var.azure_vng
    azure_vng_connection    = var.azure_vng_connection
    resource_group_location = module.azure_resource_group.resource_group_location
    resource_group_name     = module.azure_resource_group.resource_group_name
    virtual_network_name    = module.azure_network.virtual_network_name
    depends_on              = [module.azure_resource_group,module.azure_network]
}