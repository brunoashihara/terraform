############################################
# OUTPUT
############################################

output "dynamodb_arn" {
  value = aws_dynamodb_table.tf_dynamodb.arn
}
