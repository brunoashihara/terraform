############################################
# RDS
############################################

resource "aws_db_instance" "tf_rds" {
  allocated_storage    = var.aws_rds.stg
  db_name              = var.aws_rds.name
  engine               = var.aws_rds.engine
  engine_version       = var.aws_rds.version
  instance_class       = var.aws_rds.class
  username             = var.aws_rds.user
  password             = var.aws_rds.pass
  port                 = var.aws_rds.port
  parameter_group_name = var.aws_rds.parameter
  skip_final_snapshot  = true
  identifier           = var.aws_rds.ident
}