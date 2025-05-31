############################################
# OUTPUT
############################################

output "route_table_id" {
  value = oci_core_route_table.tf_rt.id
}