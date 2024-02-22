############################################
# KEY
############################################

resource "tls_private_key" "teste_azure_key" {
  algorithm = var.key.algo
  rsa_bits  = var.key.bits
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.teste_azure_key.private_key_pem
  filename        = var.key.private
  file_permission = var.key.perm
}

############################################
# KEY SSH
############################################

resource "azurerm_ssh_public_key" "teste_ssh" {
  name                = var.key.ssh
  resource_group_name = azurerm_resource_group.teste_rg.name
  location            = azurerm_resource_group.teste_rg.location
  public_key          = tls_private_key.teste_azure_key.public_key_openssh
}