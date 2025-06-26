############################################
# RDS
############################################

#tfsec:ignore:aws-rds-encrypt-instance-storage-data tfsec:ignore:aws-rds-enable-performance-insights-encryption
resource "aws_db_instance" "tf_rds" {
  #checkov:skip=CKV_AWS_354: Doesnt need CMK
  #checkov:skip=CKV_AWS_118: Doesnt need enhanced monitoring
  allocated_storage                     = var.aws_rds.stg
  db_name                               = var.aws_rds.name
  engine                                = var.aws_rds.engine
  engine_version                        = var.aws_rds.version
  instance_class                        = var.aws_rds.class
  iam_database_authentication_enabled   = true
  multi_az                              = true
  username                              = var.aws_rds.user
  password                              = var.aws_rds.pass
  port                                  = var.aws_rds.port
  parameter_group_name                  = var.aws_rds.parameter
  deletion_protection                   = true
  storage_encrypted                     = true
  skip_final_snapshot                   = true
  identifier                            = var.aws_rds.ident
  auto_minor_version_upgrade            = true
  enabled_cloudwatch_logs_exports       = ["error", "slowquery", "general", "audit"]
  backup_retention_period               = var.aws_rds.retention
  copy_tags_to_snapshot                 = true
  performance_insights_enabled          = var.aws_rds.insights
  performance_insights_retention_period = var.aws_rds.retention
}