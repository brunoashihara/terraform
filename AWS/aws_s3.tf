############################################
# S3
############################################

resource "aws_s3_bucket" "teste_s3" {
  bucket = var.s3_bucket_name
  tags = {
    Name = var.s3_bucket_name
  }
}

############################################
# S3 POLICY
############################################

resource "aws_s3_bucket_public_access_block" "teste_s3_block" {
  bucket                  = aws_s3_bucket.teste_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}