############################################
# KEY
############################################

resource "tls_private_key" "tf_key" {
  algorithm = var.aws_key.algo
}

############################################
# KEY PEM
############################################

resource "local_file" "tf_private" {
  content         = tls_private_key.tf_key.private_key_pem
  filename        = var.aws_key.private
  file_permission = var.aws_key.perm
}

############################################
# KP
############################################

resource "aws_key_pair" "tf_kp" {
  key_name   = var.aws_key.public
  public_key = tls_private_key.tf_key.public_key_openssh
}