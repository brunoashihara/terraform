############################################
# KEY
############################################

resource "tls_private_key" "tf_key" {
  algorithm = var.gcp_key.algo
  rsa_bits  = var.gcp_key.rsa
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.tf_key.private_key_pem
  filename        = var.gcp_key.private
  file_permission = var.gcp_key.perm
}