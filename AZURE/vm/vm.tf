############################################
# NETWORK INTERFACE LINUX
############################################

resource "azurerm_network_interface" "tf_ni_linux" {
  name                = var.azure_ni.linux
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = var.azure_ni.name
    subnet_id                     = sb_public_id
    private_ip_address_allocation = var.azure_ni.alloc
    public_ip_address_id          = var.linux_public_ip_id
  }
}

############################################
# NETWORK INTERFACE WINDOWS
############################################

resource "azurerm_network_interface" "tf_ni_windows" {
  name                = var.azure_ni.windows
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = var.azure_ni.name
    subnet_id                     = sb_public_id
    private_ip_address_allocation = var.azure_ni.alloc
    public_ip_address_id          = var.windows_public_ip_id
  }
}

############################################
# VIRTUAL MACHINE LINUX
############################################

resource "azurerm_linux_virtual_machine" "azure01" {
  name                  = var.azure_vm_linux.name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  size                  = var.azure_vm_linux.tier
  admin_username        = var.azure_resource_group.admin
  network_interface_ids = [azurerm_network_interface.tf_ni_linux.id]
  os_disk {
    name                 = var.azure_vm_linux.disk
    caching              = var.azure_vm_linux.cache
    storage_account_type = var.azure_vm_linux.type
  }
  source_image_reference {
    publisher = var.azure_vm_linux.publisher
    offer     = var.azure_vm_linux.offer
    sku       = var.azure_vm_linux.sku
    version   = var.azure_vm_linux.version
  }
  computer_name = var.azure_vm_linux.name
  admin_ssh_key {
    username   = var.azure_resource_group.admin
    public_key = var.public_key_openssh
  }
  disable_password_authentication = true
  connection {
    host        = self.public_ip_address
    user        = var.azure_resource_group.admin
    type        = var.azure_vm_linux.conn_type
    private_key = var.private_key_pem
    agent       = false
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /mnt/fileshare",
      "sudo mkdir /tmp/smbcredentials",
      "sudo bash -c 'echo \"username=${var.storage_account_name}\" > /tmp/smbcredentials/${var.storage_account_name}.cred'",
      "sudo bash -c 'echo \"password=${var.storage_account_key}\" >> /tmp/smbcredentials/${var.storage_account_name}.cred'",
      "sudo chmod 600 /tmp/smbcredentials/${var.storage_account_name}.cred",
      "sudo bash -c 'echo \"//${var.storage_account_name}.privatelink.file.core.windows.net/fileshare /mnt/fileshare cifs nofail,credentials=/tmp/smbcredentials/${var.storage_account_name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30\" >> /etc/fstab'",
      "sudo mount -t cifs //${var.storage_account_name}.privatelink.file.core.windows.net/fileshare /mnt/fileshare -o credentials=/tmp/smbcredentials/${var.storage_account_name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30"
    ]
  }
}

############################################
# VIRTUAL MACHINE WINDOWS
############################################

resource "azurerm_windows_virtual_machine" "azure02" {
  name                  = var.azure_vm_windows.name
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  size                  = var.azure_vm_windows.tier
  admin_username        = var.azure_resource_group.admin
  admin_password        = var.azure_resource_group.pass
  network_interface_ids = [azurerm_network_interface.tf_ni_windows.id]
  os_disk {
    name                 = var.azure_vm_windows.disk
    caching              = var.azure_vm_windows.cache
    storage_account_type = var.azure_vm_windows.type
  }
  source_image_reference {
    publisher = var.azure_vm_windows.publisher
    offer     = var.azure_vm_windows.offer
    sku       = var.azure_vm_windows.sku
    version   = var.azure_vm_windows.version
  }
}

############################################
# RUN COMMAND WINDOWS
############################################

resource "azurerm_virtual_machine_extension" "powershell" {
  name                 = var.vm_windows.ext1
  virtual_machine_id   = azurerm_windows_virtual_machine.azure02.id
  publisher            = var.vm_windows.ext1_pub
  type                 = var.vm_windows.ext1_type
  type_handler_version = var.vm_windows.ext1_vers

  protected_settings = <<SETTINGS
  {
    "commandToExecute": "powershell -Command \"cmdkey /add:\\\\${var.storage_account_name}.privatelink.file.core.windows.net /user:${var.storage_account_name} /pass:${var.storage_account_key}; New-PSDrive -Name Z -PSProvider FileSystem -Root \\\\\\\\${var.storage_account_name}.privatelink.file.core.windows.net\\\\fileshare -Persist\""
  }
  SETTINGS
}