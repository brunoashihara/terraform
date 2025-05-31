############################################
# OUTPUT
############################################

output "key_name" {
  value = aws_key_pair.tf_kp.key_name
}

output "private_key_pem" {
  value = tls_private_key.tf_key.private_key_pem
}

output "public_key_openssh" {
  value = tls_private_key.tf_key.public_key_openssh
}
