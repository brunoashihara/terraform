############################################
# KEY
############################################

resource "tls_private_key" "tf_key" {
  algorithm = var.key.algo
  rsa_bits  = "2048"
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.tf_key.private_key_pem
  filename        = var.key.file
  file_permission = var.key.perm
}