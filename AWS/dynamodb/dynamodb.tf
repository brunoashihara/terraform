############################################
# DYNAMODB
############################################

resource "aws_dynamodb_table" "tf_dynamodb" {
  name           = var.aws_dynamodb.name
  billing_mode   = var.aws_dynamodb.billing
  read_capacity  = var.aws_dynamodb.r_cap
  write_capacity = var.aws_dynamodb.w_cap
  hash_key       = var.aws_dynamodb.hash
  range_key      = var.aws_dynamodb.r_key
  attribute {
    name = var.aws_dynamodb.hash
    type = var.aws_dynamodb.attr_type
  }
  attribute {
    name = var.aws_dynamodb.r_key
    type = var.aws_dynamodb.attr_type
  }
  ttl {
    attribute_name = var.aws_dynamodb.ttl_name
    enabled        = false
  }
}
