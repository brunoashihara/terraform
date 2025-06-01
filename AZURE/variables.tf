############################################
# BLOB
############################################

variable "azure_blob" {
  description = "Blob Variables"
  type = object({
    name  = string
    type  = string
  })
}

############################################
# CONTAINER
############################################

variable "azure_container" {
  description = "Container Variables"
  type = object({
    ctn_cpu   = string
    ctn_img   = string
    ctn_mem   = string
    ctn_name  = string
    ctn_port  = number
    ctn_proto = string
    ip        = string
    name      = string
    os        = string
  })
}

############################################
# COSMODB
############################################

variable "azure_cosmodb" {
  description = "Container Variables"
  type = object({
    cap1      = string
    cap2      = string
    cap3      = string
    cap4      = string
    cons      = string
    failover  = number
    kind      = string
    location  = string
    name      = string
    type      = string
  })
}

############################################
# DATABASE FIREWALL
############################################

variable "azure_dbs_fw" {
  description = "Database Firewall Variables"
  type = object({
    fin = string
    ini = string
  })
}

############################################
# DNS ZONE
############################################

variable "azure_dns_zone" {
  description = "DNS Zone Variables"
  type = object({
    name  = string
  })
}

############################################
# FILESHARE
############################################

variable "azure_fileshare" {
  description = "Fileshare Variables"
  type = object({
    name      = string
    quota     = number
    sub_name  = string
    tag       = string
  })
}


############################################
# KEY
############################################

variable "azure_key" {
  description = "Key Variables"
  type = object({
    algo      = string
    bits      = string
    private   = string
    perm      = string
    ssh       = string
  })
}

############################################
# LOCAL NETWORK GATEWAY
############################################

variable "azure_lng" {
  description = "Local Network Gateway Variables"
  type = object({
    gw    = string
    name  = string
  })
}

############################################
# MSSQL
############################################

variable "azure_mssql" {
  description = "MSSQL Variables"
  type = object({
    db_col    = string
    db_lic    = string
    db_name   = string
    db_size   = number
    db_sku    = string
    fw_name   = string
    name      = string
    version   = string
  })
}

############################################
# MYSQL
############################################

variable "azure_mysql" {
  description = "MySQL Variables"
  type = object({
    db_char   = string
    db_col    = string
    db_name   = string
    fw_name   = string
    name      = string
    sku       = string
    stg       = number
    tls       = string
    version   = string
  })
}

############################################
# NETWORK
############################################

variable "azure_network" {
  description = "Network Variables"
  type = object({
    alloc     = string
    linux     = string
    vpn       = string
    vpn_alloc = string
    windows   = string
  })
}

############################################
# NETWORK INTERFACE
############################################

variable "azure_ni" {
  description = "Network Interface Variables"
  type = object({
    alloc     = string
    linux     = string
    name      = string
    windows   = string
  })
}

############################################
# NETWORK SECURITY GROUPS PRIVATE
############################################

variable "azure_nsg_private" {
  description = "Network Security Group Private Variables"
  type = object({
    name  = string
    rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
}

############################################
# NETWORK SECURITY GROUPS PUBLIC
############################################

variable "azure_nsg_public" {
  description = "Network Security Group Public Variables"
  type = object({
    name  = string
    rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
}

############################################
# POSTGRES
############################################

variable "azure_postgres" {
  description = "Postgres Variables"
  type = object({
    db_char   = string
    db_col    = string
    db_name   = string
    fw_name   = string
    name      = string
    sku       = string
    ssl       = string
    stg       = number
    version   = string
  })
}

############################################
# RESOURCE GROUP
############################################

variable "azure_resource_group" {
  description = "Resource group Variables"
  type = object({
    admin   = string
    name    = string
    onprem  = string
    pass    = string
    region  = string
  })
}

############################################
# STORAGE ACCOUNT
############################################

variable "azure_storage" {
  description = "Storage Account Variables"
  type = object({
    name    = string
    replic  = string
    tier    = string
  })
}

############################################
# SUBNET PRIVATE
############################################

variable "azure_sb_private" {
  description = "Subnet Private Variables"
  type = object({
    ip    = string
    name  = string
  })
}

############################################
# SUBNET PUBLIC
############################################

variable "azure_sb_public" {
  description = "Subnet Public Variables"
  type = object({
    ip    = string
    name  = string
  })
}

############################################
# SUBNET VPN
############################################

variable "azure_sb_vpn" {
  description = "Subnet VPN Variables"
  type = object({
    ip    = string
    name  = string
  })
}

############################################
# VIRTUAL MACHINE LINUX
############################################

variable "azure_vm_linux" {
  description = "Virtual Machine Linux Variables"
  type = object({
    cache     = string
    conn_type = string
    disk      = string
    sku       = string
    name      = string
    offer     = string
    publisher = string
    tier      = string
    type      = string
    version   = string
  })
}

############################################
# VIRTUAL MACHINE WINDOWS
############################################

variable "azure_vm_windows" {
  description = "Virtual Machine Windows Variables"
  type = object({
    cache     = string
    disk      = string
    ext1      = string
    ext1_pub  = string
    ext1_type = string
    ext1_vers = string
    sku       = string
    name      = string
    offer     = string
    publisher = string
    tier      = string
    type      = string
    version   = string
  })
}

############################################
# VIRTUAL NETWORK
############################################

variable "azure_vn" {
  description = "Virtual Network Variables"
  type = object({
    ip    = string
    name  = string
  })
}

############################################
# VIRTUAL NETWORK GATEWAY
############################################

variable "azure_vng" {
  description = "Virtual Network Gateway Variables"
  type = object({
    alloc     = string
    ip        = string
    sku       = string
    name      = string
    type      = string
    vtype     = string
  })
}

############################################
# VIRTUAL NETWORK GATEWAY CONNECTION
############################################

variable "azure_vng_connection" {
  description = "Virtual Network Gateway Connection Variables"
  type = object({
    dh        = string
    encrypt   = string
    integrity = string
    key       = string
    name      = string
    pfs       = string
    type      = string
  })
}