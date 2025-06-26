############################################
# DYNAMODB
############################################

#tfsec:ignore:aws-dynamodb-table-customer-key tfsec:ignore:aws-dynamodb-enable-at-rest-encryption
resource "aws_dynamodb_table" "tf_dynamodb" {
  #checkov:skip=CKV_AWS_119: Doesnt need Customer Managed Key
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
  point_in_time_recovery {
    enabled = true
  }
}

############################################
# DYNAMODB AUTOSCALING READ TARGET
############################################

resource "aws_appautoscaling_target" "tf_read_target" {
  max_capacity       = var.aws_dynamodb.max_cap
  min_capacity       = var.aws_dynamodb.min_cap
  resource_id        = "table/${aws_dynamodb_table.tf_dynamodb.name}"
  scalable_dimension = var.aws_dynamodb.read_scale_dim
  service_namespace  = var.aws_dynamodb.service_ns
}

############################################
# DYNAMODB AUTOSCALING READ POLICY
############################################

resource "aws_appautoscaling_policy" "tf_read_policy" {
  name               = "${aws_dynamodb_table.tf_dynamodb.name}-read-policy"
  policy_type        = var.aws_dynamodb.policy
  resource_id        = aws_appautoscaling_target.tf_read_target.resource_id
  scalable_dimension = aws_appautoscaling_target.tf_read_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.tf_read_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.aws_dynamodb.read_metric
    }
    target_value       = var.aws_dynamodb.target
    scale_in_cooldown  = var.aws_dynamodb.scale_in
    scale_out_cooldown = var.aws_dynamodb.scale_out
  }
}

############################################
# DYNAMODB AUTOSCALING WRITE TARGET
############################################

resource "aws_appautoscaling_target" "tf_write_target" {
  max_capacity       = var.aws_dynamodb.max_cap
  min_capacity       = var.aws_dynamodb.min_cap
  resource_id        = "table/${aws_dynamodb_table.tf_dynamodb.name}"
  scalable_dimension = var.aws_dynamodb.write_scake_dim
  service_namespace  = var.aws_dynamodb.service_ns
}

############################################
# DYNAMODB AUTOSCALING WRITE POLICY
############################################

resource "aws_appautoscaling_policy" "tf_write_policy" {
  name               = "${aws_dynamodb_table.tf_dynamodb.name}-write-policy"
  policy_type        = var.aws_dynamodb.policy
  resource_id        = aws_appautoscaling_target.tf_write_target.resource_id
  scalable_dimension = aws_appautoscaling_target.tf_write_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.tf_write_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.aws_dynamodb.write_metric
    }
    target_value       = var.aws_dynamodb.target
    scale_in_cooldown  = var.aws_dynamodb.scale_in
    scale_out_cooldown = var.aws_dynamodb.scale_out
  }
}