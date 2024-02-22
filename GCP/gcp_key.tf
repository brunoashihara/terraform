############################################
# KEY
############################################

resource "tls_private_key" "teste_gcp_key" {
  algorithm = var.key.algo
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.teste_gcp_key.private_key_pem
  filename        = var.key.private
  file_permission = var.key.perm
}