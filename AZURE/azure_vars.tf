############################################
# RESOURCE GROUP
############################################

variable "rg" {
  description = "Variaveis resource group"
  default     = {
    name      = "teste-rg"
    region    = "East US"
    admin     = "adminuser"
    pass      = "123Mudar@@"
    onprem    = "x.x.x.x/x"
  }
}

############################################
# BLOB
############################################

variable "blob" {
  description = "Variaveis blob"
  default     = {
    name      = "teste-blob"
    type      = "blob"
  }
}

############################################
# CONTAINER
############################################

variable "container" {
  description = "Variaveis container"
  default     = {
    name      = "teste-container"
    ip        = "public"
    os        = "Linux"
    ctn_name  = "teste-ctn"
    ctn_img   = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    ctn_cpu   = "0.5"
    ctn_mem   = "1.5"
    ctn_port  = 80
    ctn_proto = "TCP"
  }
}

############################################
# COSMODB
############################################

variable "cosmodb" {
  description = "Variaveis cosmodb"
  default     = {
    name      = "teste-cosmodb"
    type      = "Standard"
    kind      = "MongoDB"
    cap1      = "EnableMongo"
    cap2      = "EnableAggregationPipeline"
    cap3      = "mongoEnableDocLevelTTL"
    cap4      = "MongoDBv3.4"
    cons      = "Strong"
    location  = "eastus"
    failover  = 0
  }
}

############################################
# DATABASE
############################################

variable "dbs_fw" {
  description = "Variaveis dbs fw"
  default     = {
    ini    = "0.0.0.0/0"
    fin    = "255.255.255.255"
  }
}

variable "mssql" {
  description = "Variaveis dbs mssql"
  default     = {
    name      = "teste-mssql"
    version   = "12.0"
    db_name   = "teste-mssql-db"
    db_col    = "SQL_Latin1_General_CP1_CI_AS"
    db_lic    = "LicenseIncluded"
    db_size   = 5
    db_sku    = "S0"
    fw_name   = "teste-mssql-fw"
  }
}

variable "postgres" {
  description = "Variaveis dbs postgres"
  default     = {
    name      = "teste-postgres"
    sku       = "B_Gen5_2"
    stg       = 5120
    version   = "9.5"
    ssl       = "true"
    db_name   = "testepostgresdb"
    db_char   = "UTF8"
    db_col    = "English_United States.1252"
    fw_name   = "teste-postgres-fw"
  }
}

variable "mysql" {
  description = "Variaveis dbs mysql"
  default     = {
    name      = "teste-mysql"
    sku       = "GP_Gen5_2"
    stg       = 5120
    version   = "5.7"
    tls       = "TLS1_2"
    db_name   = "teste-mysql-db"
    db_char   = "utf8"
    db_col    = "utf8_unicode_ci"
    fw_name   = "teste-mysql-fw"
  }
}

############################################
# FILESHARE
############################################

variable "fileshare" {
  description = "Variaveis fileshare"
  default     = {
    name      = "fileshare"
    quota     = 50
  }
}

############################################
# KEY
############################################

variable "key" {
  description = "Variaveis key"
  default     = {
    algo      = "RSA"
    bits      = "4096"
    private   = "teste-azure-key.pem"
    perm      = "0600"
    ssh       = "teste-azure-key"
  }
}

############################################
# VIRTUAL NETWORK
############################################

variable "vn" {
  description = "Variaeis vn"
  default     = {
    name      = "teste-vn"
    ip        = "192.168.0.0/16"

  }
}

############################################
# SUBNET
############################################

variable "sb_public" {
  description = "Variaveis sb public"
  default     = {
    name      = "teste-sb-public"
    ip        = "192.168.20.0/24"
  }
}

variable "sb_private" {
  description = "Variaveis sb public"
  default     = {
    name      = "teste-sb-private"
    ip        = "192.168.21.0/24"
  }
}

variable "sb_vpn" {
  description = "Variaveis sb public"
  default     = {
    name      = "GatewaySubnet"
    ip        = "192.168.22.0/24"
  }
}

############################################
# NETWORKS
############################################

variable "network" {
  description = "Variaveis network"
  default     = {
    linux     = "teste-ip-linux"
    windows   = "teste-ip-windows"
    vpn       = "teste-ip-vpn"
    alloc     = "Static"
    vpn_alloc = "Dynamic"
  }
}

############################################
# NETWORK SECURITY GROUPS
############################################

variable "nsg_public" {
  description = "Variaveis sg"
  default     = {
    name      = "teste-sg-public"
    direct    = "Inbound"
    access    = "Allow"
    tcp       = "Tcp"
    udp       = "Udp"
    icmp      = "Icmp"
    coringa   = "*"
    ssh       = "teste-ssh"
    ssh_prio  = "1001"
    ssh_port  = "22"
    rdp       = "teste-rdp"
    rdp_prio  = "1002"
    rdp_port  = "3389"
    web       = "teste-web"
    web_prio  = "1003"
    web_port  = "80"
    pg        = "teste-postgres"
    pg_prio   = "1004
    pg_port   = "5432"
    sql       = "teste-sql"
    sql_prio  = "1005"
    sql_port  = "1433"
    smb       = "teste-smb"
    smb_prio  = "1006"
    smb_port  = "445"
    icmp      = "teste-icmp"
    icmp_prio = "1007"
  }
}

############################################
# NETWORK INTERFACE
############################################

variable "ni" {
  description = "Variaveis ni"
  default     = {
    name      = "internal"
    alloc     = "Dynamic"
    linux     = "teste-ni-linux"
    windows   = "teste-ni-windows"
  }
}

############################################
# STORAGE
############################################

variable "storage" {
  description = "Variaveis storage"
  default     = {
    name      = "teste0sa"
    tier      = "Standard"
    replic    = "LRS"
  }
}

############################################
# VIRTUAL MACHINE
############################################

variable "vm_linux" {
  description = "Variaveis vm linux"
  default     = {
    name      = "teste-linux"
    tier      = "Standard_B1s"
    disk      = "teste-linux-disk"
    cache     = "ReadWrite"
    type      = "Standard_LRS"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
    conn_type = "ssh"

  }
}

variable "vm_windows" {
  description = "Variaveis vm windows"
  default     = {
    name      = "azureuser"
    tier      = "Standard_B1s"
    disk      = "teste-windows-disk"
    cache     = "ReadWrite"
    type      = "Standard_LRS"
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
    ext1      = "SMB"
    ext1_pub  = "Microsoft.Compute"
    ext1_type = "CustomScriptExtension"
    ext1_vers = "1.9"
  }
}

############################################
# VPN
############################################

variable "vng" {
  description = "Variaveis vng"
  default     = {
    name      = "teste-vng"
    type      = "Vpn"
    vtype     = "RouteBased"
    sku       = "Standard"
    ip        = "teste-vng-ip"
    alloc     = "Dynamic"
  }
}

variable "lng" {
  description = "Variaveis lng"
  default     = {
    name      = "teste-lng"
    gw        = "x.x.x.x"
  }
}

variable "vng_connection" {
  description = "Variaveis vng connection"
  default     = {
    name      = "teste-vng-connection"
    type      = "IPsec"
    dh        = "DHGroup2"
    encrypt   = "AES256"
    integrity = "SHA1"
    pfs       = "None"
    key       = "##123Mudar@@"
  }
}