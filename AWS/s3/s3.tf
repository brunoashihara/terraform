############################################
# S3
############################################

#tfsec:ignore:aws-s3-encryption-customer-key tfsec:ignore:aws-s3-enable-bucket-encryption
resource "aws_s3_bucket" "tf_s3" {
  #checkov:skip=CKV2_AWS_62: Doesnt need for the moment (no lambda here)
  #checkov:skip=CKV_AWS_144: Doesnt need cross region replication
  #checkov:skip=CKV_AWS_145: Doesnt need KMS for now
  bucket = var.aws_s3.name
  tags = {
    Name = var.aws_s3.name
  }
  logging {
    target_bucket = aws_s3_bucket.tf_s3.id
    target_prefix = "access-logs/"
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

############################################
# S3 VERSION
############################################

resource "aws_s3_bucket_versioning" "tf_s3_version" {
  bucket = aws_s3_bucket.tf_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

############################################
# S3 LIFECYCLE
############################################

resource "aws_s3_bucket_lifecycle_configuration" "tf_s3_lifecycle" {
  #checkov:skip=CKV_AWS_300: Have added abort_icomplete_multipart_upload and fails
  bucket = aws_s3_bucket.tf_s3.id
  rule {
    id     = "log-expiration"
    status = "Enabled"
    filter {
      prefix = "logs/"
    }
    expiration {
      days = 90
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}