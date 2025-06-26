############################################
# DYNAMODB
############################################

module "aws_dynamodb" {
  source       = "./dynamodb"
  aws_dynamodb = var.aws_dynamodb
}

############################################
# EC2
############################################

module "aws_ec2" {
  source          = "./ec2"
  aws_ec2         = var.aws_ec2
  efs_dns         = module.aws_efs.efs_dns
  key_name        = module.aws_key.key_name
  private_key_pem = module.aws_key.private_key_pem
  sb_public_id    = module.aws_vpc.sb_public_id
  sg_public_id    = module.aws_security_group.sg_public_id
  depends_on      = [module.aws_efs, module.aws_key, module.aws_security_group, module.aws_vpc]
}

############################################
# EFS
############################################

module "aws_efs" {
  source        = "./efs"
  aws_efs       = var.aws_efs
  sb_private_id = module.aws_vpc.sb_private_id
  sg_private_id = module.aws_security_group.sg_private_id
  depends_on    = [module.aws_security_group, module.aws_vpc]
}

############################################
# KEY
############################################

module "aws_key" {
  source  = "./key"
  aws_key = var.aws_key
}

############################################
# NETWORK ACCESS CONTROL LIST
############################################

module "aws_nacl" {
  source           = "./nacl"
  aws_nacl_private = var.aws_nacl_private
  aws_nacl_public  = var.aws_nacl_public
  sb_private_id    = module.aws_vpc.sb_private_id
  sb_public_id     = module.aws_vpc.sb_public_id
  vpc_id           = module.aws_vpc.vpc_id
  depends_on       = [module.aws_vpc]
}

############################################
# ROUTE TABLE
############################################

module "aws_route_table" {
  source              = "./route_table"
  aws_rt_private      = var.aws_rt_private
  aws_rt_public       = var.aws_rt_public
  internet_gateway_id = module.aws_vpc.internet_gateway_id
  sb_private_id       = module.aws_vpc.sb_private_id
  sb_public_id        = module.aws_vpc.sb_public_id
  vpc_id              = module.aws_vpc.vpc_id
  depends_on          = [module.aws_vpc]
}

############################################
# RDS
############################################

module "aws_rds" {
  source  = "./rds"
  aws_rds = var.aws_rds
}

############################################
# S3
############################################

module "aws_s3" {
  source = "./s3"
  aws_s3 = var.aws_s3
}

############################################
# SECURITY GROUP
############################################

module "aws_security_group" {
  source         = "./security_group"
  aws_sg_private = var.aws_sg_private
  aws_sg_public  = var.aws_sg_public
  vpc_id         = module.aws_vpc.vpc_id
  depends_on     = [module.aws_vpc]
}

############################################
# VPC
############################################

module "aws_vpc" {
  source         = "./vpc"
  aws_sb_private = var.aws_sb_private
  aws_sb_public  = var.aws_sb_public
  aws_vpc        = var.aws_vpc
}