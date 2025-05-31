############################################
# OUTPUT
############################################

output "nsg_private_id" {
  value = oci_core_network_security_group.tf_nsg_private.id
}

output "nsg_public_id" {
  value = oci_core_network_security_group.tf_nsg_public.id
}