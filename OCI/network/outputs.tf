############################################
# OUTPUT
############################################

output "igw_id" {
  value = oci_core_internet_gateway.tf_igw.id
}

output "sb_private_id" {
  value = oci_core_subnet.tf_sb_private.id
}

output "sb_public_id" {
  value = oci_core_subnet.tf_sb_public.id
}

output "vcn_id" {
  value = oci_core_vcn.tf_vcn.id
}