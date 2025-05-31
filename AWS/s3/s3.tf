############################################
# S3
############################################

resource "aws_s3_bucket" "tf_s3" {
  bucket = var.aws_s3.name
  tags = {
    Name = var.aws_s3.name
  }
}

############################################
# S3 POLICY
############################################

resource "aws_s3_bucket_public_access_block" "tf_s3_block" {
  bucket                  = aws_s3_bucket.tf_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}