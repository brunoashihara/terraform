############################################
# KEY
############################################

resource "tls_private_key" "teste_aws_key" {
  algorithm = var.kp.algo
}

############################################
# KEY PEM
############################################

resource "local_file" "private_key" {
  content         = tls_private_key.teste_aws_key.private_key_pem
  filename        = var.kp.private
  file_permission = var.kp.perm
}

############################################
# KP
############################################

resource "aws_key_pair" "teste_kp" {
  key_name   = var.kp.public
  public_key = tls_private_key.teste_aws_key.public_key_openssh
}