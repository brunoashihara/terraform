############################################
# OUTPUT
############################################

output "rds_endpoint" {
  value = aws_db_instance.tf_rds.endpoint
}