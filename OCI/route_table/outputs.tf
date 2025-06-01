############################################
# OUTPUT
############################################

output "route_table_private_id" {
  value = oci_core_route_table.tf_rt_private.id
}

output "route_table_public_id" {
  value = oci_core_route_table.tf_rt_public.id
}