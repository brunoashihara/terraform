############################################
# OUTPUT
############################################

output "efs_dns" {
  value = aws_efs_file_system.tf_efs.dns_name
}