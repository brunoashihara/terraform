############################################
# OUTPUT
############################################

output "s3_bucket" {
  value = aws_s3_bucket.tf_s3.bucket_domain_name
}