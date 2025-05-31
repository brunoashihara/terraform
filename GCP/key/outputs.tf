############################################
# OUTPUT
############################################

output "public_key_openssh" {
  value = tls_private_key.tf_key.public_key_openssh
}