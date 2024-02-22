############################################
# VIRTUAL MACHINE LINUX
############################################

resource "azurerm_linux_virtual_machine" "teste_linux" {
  depends_on = [
    azurerm_storage_share.teste_share
  ]
  name                  = var.vm_linux.name
  resource_group_name   = azurerm_resource_group.teste_rg.name
  location              = azurerm_resource_group.teste_rg.location
  size                  = var.vm_linux.tier
  admin_username        = var.rg.admin
  network_interface_ids = [azurerm_network_interface.teste_ni_linux.id]
  os_disk {
    name                 = var.vm_linux.disk
    caching              = var.vm_linux.cache
    storage_account_type = var.vm_linux.type
  }
  source_image_reference {
    publisher = var.vm_linux.publisher
    offer     = var.vm_linux.offer
    sku       = var.vm_linux.sku
    version   = var.vm_linux.version
  }
  computer_name = var.vm_linux.name
  admin_ssh_key {
    username   = var.rg.admin
    public_key = tls_private_key.teste_azure_key.public_key_openssh
  }
  disable_password_authentication = true
  connection {
    host        = self.public_ip_address
    user        = var.rg.admin
    type        = var.vm_linux.conn_type
    private_key = tls_private_key.teste_azure_key.private_key_pem
    agent       = false
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /mnt/fileshare",
      "sudo mkdir /tmp/smbcredentials",
      "sudo bash -c 'echo \"username=${azurerm_storage_account.teste_sa.name}\" > /tmp/smbcredentials/${azurerm_storage_account.teste_sa.name}.cred'",
      "sudo bash -c 'echo \"password=${azurerm_storage_account.teste_sa.primary_access_key}\" >> /tmp/smbcredentials/${azurerm_storage_account.teste_sa.name}.cred'",
      "sudo chmod 600 /tmp/smbcredentials/${azurerm_storage_account.teste_sa.name}.cred",
      "sudo bash -c 'echo \"//${azurerm_storage_account.teste_sa.name}.file.core.windows.net/fileshare /mnt/fileshare cifs nofail,credentials=/tmp/smbcredentials/${azurerm_storage_account.teste_sa.name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30\" >> /etc/fstab'",
      "sudo mount -t cifs //${azurerm_storage_account.teste_sa.name}.file.core.windows.net/fileshare /mnt/fileshare -o credentials=/tmp/smbcredentials/${azurerm_storage_account.teste_sa.name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30"
    ]
  }
}

############################################
# VIRTUAL MACHINE LINUX
############################################

resource "azurerm_windows_virtual_machine" "teste_windows" {
  depends_on = [
    azurerm_storage_share.teste_share
  ]
  name                  = var.vm_windows.name
  resource_group_name   = azurerm_resource_group.teste_rg.name
  location              = azurerm_resource_group.teste_rg.location
  size                  = var.vm_windows.tier
  admin_username        = var.rg.admin
  admin_password        = var.rg.pass
  network_interface_ids = [azurerm_network_interface.teste_ni_windows.id]
  os_disk {
    name                 = var.vm_windows.disk
    caching              = var.vm_windows.cache
    storage_account_type = var.vm_windows.type
  }
  source_image_reference {
    publisher = var.vm_windows.publisher
    offer     = var.vm_windows.offer
    sku       = var.vm_windows.sku
    version   = var.vm_windows.version
  }
}

############################################
# RUN COMMAND WINDOWS
############################################

#resource "azurerm_virtual_machine_extension" "teste_powershell" {
#    name = var.vm_windows.ext1
#    virtual_machine_id = azurerm_windows_virtual_machine.teste_windows.id
#    publisher = var.vm_windows.ext1_pub
#    type = var.vm_windows.ext1_type
#    type_handler_version = var.vm_windows.ext1_vers
#    protected_settings = <<SETTINGS
#    {
#        "commandToExecute": "powershell Invoke-Expresion -Command \"cmdkey /add:${azurerm_storage_account.teste-sa.name}.file.core.windows.net/fileshare /user:${azurerm_storage_account.teste-sa.name} /pass:${azurerm_storage_account.teste-sa.primary_access_key}\""
#    }
#    SETTINGS
#}