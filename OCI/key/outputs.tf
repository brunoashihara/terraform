############################################
# OUTPUT
############################################

output "private_key" {
  value = tls_private_key.tf_key.private_key_pem
}

output "public_key_openssh" {
  value = tls_private_key.tf_key.public_key_openssh
}