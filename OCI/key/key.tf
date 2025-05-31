############################################
# KEY
############################################

resource "tls_private_key" "tf_key" {
  algorithm = var.oci_key.algo
  rsa_bits  = var.oci_key.bit
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.tf_key.private_key_pem
  filename        = var.oci_key.file
  file_permission = var.oci_key.perm
}