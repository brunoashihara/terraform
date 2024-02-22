############################################
# OUTPUT
############################################

output "dynamo_arn" {
  value = aws_dynamodb_table.teste_dynamodb.arn
}

output "linux_ip" {
  value = aws_instance.teste_linux.public_ip
}

output "windows_ip" {
  value = aws_instance.teste_windows.public_ip
}

output "efs_dns" {
  value = aws_efs_file_system.teste_efs.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.teste_rds.endpoint
}

output "s3_bucket" {
  value = aws_s3_bucket.teste_s3.bucket_domain_name
}