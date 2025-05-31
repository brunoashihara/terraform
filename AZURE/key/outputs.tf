############################################
# OUTPUT
############################################

output "private_key_pem" {
  value = tls_private_key.tf_azure_key.private_key_pem
}

output "public_key_openssh" {
  value = tls_private_key.tf_azure_key.public_key_openssh
}
