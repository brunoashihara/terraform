############################################
# OUTPUT
############################################

output "dynamodb" {
  value = module.aws_dynamodb.dynamodb_arn
}

output "linux" {
  value = module.aws_ec2.linux_ip
}

output "efs" {
  value = module.aws_efs.efs_dns
}

output "rds" {
  value = module.aws_rds.rds_endpoint
}

output "s3" {
  value = module.aws_s3.s3_bucket
}

output "windows" {
  value = module.aws_ec2.windows_ip
}