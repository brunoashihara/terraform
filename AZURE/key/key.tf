############################################
# KEY
############################################

resource "tls_private_key" "tf_azure_key" {
  algorithm = var.azure_key.algo
  rsa_bits  = var.azure_key.bits
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.tf_azure_key.private_key_pem
  filename        = var.azure_key.private
  file_permission = var.azure_key.perm
}

############################################
# KEY SSH
############################################

resource "azurerm_ssh_public_key" "tf_ssh" {
  name                = var.azure_key.ssh
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  public_key          = tls_private_key.tf_azure_key.public_key_openssh
}