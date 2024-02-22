############################################
# DYNAMODB
############################################

resource "aws_dynamodb_table" "teste_dynamodb" {
  name           = var.dynamodb.name
  billing_mode   = var.dynamodb.billing
  read_capacity  = var.dynamodb.r_cap
  write_capacity = var.dynamodb.w_cap
  hash_key       = var.dynamodb.hash
  range_key      = var.dynamodb.r_key
  attribute {
    name = var.dynamodb.hash
    type = var.dynamodb.attr_type
  }
  attribute {
    name = var.dynamodb.r_key
    type = var.dynamodb.attr_type
  }
  ttl {
    attribute_name = var.dynamodb.ttl_name
    enabled        = false
  }
}
