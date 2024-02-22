############################################
# RDS
############################################

resource "aws_db_instance" "teste_rds" {
  allocated_storage    = var.rds.stg
  db_name              = var.rds.name
  engine               = var.rds.engine
  engine_version       = var.rds.version
  instance_class       = var.rds.class
  username             = var.rds.user
  password             = var.rds.pass
  port                 = var.rds.port
  parameter_group_name = var.rds.parameter
  skip_final_snapshot  = true
  identifier           = var.rds.ident
}