############################################
# S3
############################################

variable "aws_s3" {
  description = "S3 Variables"
  type  = object({
    name     = string
  })
}