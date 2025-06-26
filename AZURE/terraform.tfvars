############################################
# BLOB
############################################

azure_blob = {
  name = "tf-blob"
  type = "private"
}

############################################
# CONTAINER
############################################

azure_container = {
  ctn_cpu   = "0.5"
  ctn_img   = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
  ctn_mem   = "1.5"
  ctn_name  = "tf-ctn"
  ctn_port  = 80
  ctn_proto = "TCP"
  ip        = "Private"
  name      = "tf-container"
  os        = "Linux"
  identity  = "SystemAssigned"
}

############################################
# COSMODB
############################################

azure_cosmodb = {
  cap1     = "EnableMongo"
  cap2     = "EnableAggregationPipeline"
  cap3     = "mongoEnableDocLevelTTL"
  cap4     = "MongoDBv3.4"
  cons     = "Strong"
  failover = 0
  kind     = "MongoDB"
  location = "eastus"
  name     = "tf-cosmodb"
  type     = "Standard"
}

############################################
# DATABASE FIREWALL
############################################

azure_dbs_fw = {
  fin = "0.0.0.0"
  ini = "0.0.0.0"
}

############################################
# MSSQL
############################################

azure_mssql = {
  db_col    = "SQL_Latin1_General_CP1_CI_AS"
  db_lic    = "LicenseIncluded"
  db_name   = "tf-mssql-db"
  db_size   = 5
  db_sku    = "S0"
  fw_name   = "tf-mssql-fw"
  name      = "tf-mssql"
  version   = "12.0"
  tls       = "1.2"
  retention = 90
  sub_name  = "sqlServer"
  email     = ["bhka.cloud@gmail.com"]
  upn       = "bhka.cloud_gmail.com#EXT#@bhkacloudgmail.onmicrosoft.com"
}

############################################
# DNS ZONE
############################################

azure_dns_zone = {
  name = "privatelink.file.core.windows.net"
}

############################################
# FILESHARE
############################################

azure_fileshare = {
  name     = "fileshare"
  quota    = 50
  sub_name = "file"
  tag      = "dev"
}

############################################
# KEY
############################################

azure_key = {
  algo    = "RSA"
  bits    = "4096"
  private = "azure.pem"
  perm    = "0600"
  ssh     = "tf-azure-key"
}

############################################
# LOCAL NETWORK GATEWAY
############################################

azure_lng = {
  gw   = "0.0.0.0"
  name = "tf-lng"
}

############################################
# NETWORK
############################################

azure_network = {
  alloc     = "Static"
  linux     = "tf-ip-linux"
  vpn       = "tf-ip-vpn"
  vpn_alloc = "Dynamic"
  windows   = "tf-ip-windows"
}

############################################
# NETWORK INTERFACE
############################################

azure_ni = {
  alloc   = "Dynamic"
  linux   = "tf-ni-linux"
  name    = "internal"
  windows = "tf-ni-windows"
}

############################################
# NETWORK SECURITY GROUPS PRIVATE
############################################

azure_nsg_private = {
  name = "tf-sg-private"
  rules = {
    all = {
      name                       = "Allow-From-VNet"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
  }
}

############################################
# NETWORK SECURITY GROUPS PUBLIC
############################################

azure_nsg_public = {
  name = "tf-sg-public"
  rules = {
    ssh = {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }

    rdp = {
      name                       = "Allow-rdp"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }

    http = {
      name                       = "Allow-HTTP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }

    https = {
      name                       = "Allow-HTTPS"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }

    ping = {
      name                       = "Allow-ICMP"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Icmp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "0.0.0.0/0"
      destination_address_prefix = "*"
    }
  }
}

############################################
# RESOURCE GROUP
############################################

azure_resource_group = {
  admin  = "adminuser"
  name   = "tf-rg"
  onprem = "0.0.0.0/0"
  pass   = "trocarsenha"
  region = "East US"
}

############################################
# STORAGE ACCOUNT
############################################

azure_storage = {
  name   = "tf00sa"
  tier   = "Standard"
  replic = "LRS"
  tls    = "TLS1_2"
}

############################################
# SUBNET PRIVATE
############################################

azure_sb_private = {
  ip   = "10.150.40.0/24"
  name = "tf-sb-private"
}

############################################
# SUBNET PUBLIC
############################################

azure_sb_public = {
  ip   = "10.150.41.0/24"
  name = "tf-sb-public"
}

############################################
# SUBNET VPN
############################################

azure_sb_vpn = {
  ip   = "10.150.42.0/24"
  name = "GatewaySubnet"
}

############################################
# VIRTUAL MACHINE LINUX
############################################

azure_vm_linux = {
  cache     = "ReadWrite"
  conn_type = "ssh"
  disk      = "vm-linux-disk"
  sku       = "22_04-lts-gen2"
  name      = "azure01"
  offer     = "0001-com-ubuntu-server-jammy"
  publisher = "Canonical"
  tier      = "Standard_B1s"
  type      = "Standard_LRS"
  version   = "latest"
}

############################################
# VIRTUAL MACHINE WINDOWS
############################################

azure_vm_windows = {
  cache     = "ReadWrite"
  disk      = "vm-windows-disk"
  ext1      = "SMB"
  ext1_pub  = "Microsoft.Compute"
  ext1_type = "CustomScriptExtension"
  ext1_vers = "1.9"
  sku       = "2022-Datacenter"
  name      = "azure02"
  offer     = "WindowsServer"
  publisher = "MicrosoftWindowsServer"
  tier      = "Standard_B1s"
  type      = "Standard_LRS"
  version   = "latest"
}

############################################
# VIRTUAL NETWORK
############################################

azure_vn = {
  ip   = "10.150.40.0/22"
  name = "tf-vn"
}

############################################
# VIRTUAL NETWORK GATEWAY
############################################

azure_vng = {
  alloc = "Dynamic"
  ip    = "tf-vng-ip"
  sku   = "Standard"
  name  = "tf-vng"
  type  = "Vpn"
  vtype = "RouteBased"
}

############################################
# VIRTUAL NETWORK GATEWAY CONNECTION
############################################

azure_vng_connection = {
  dh        = "DHGroup2"
  encrypt   = "AES256"
  integrity = "SHA1"
  key       = "trocarsenha"
  name      = "tf-vng-connection"
  pfs       = "None"
  type      = "IPsec"
}