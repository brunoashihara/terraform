############################################
# DYNAMODB
############################################

aws_dynamodb = {
  attr_type = "S"
  billing   = "PROVISIONED"
  hash      = "UserId"
  name      = "tf-dynamodb"
  r_key     = "GameTitle"
  r_cap     = 20
  ttl_name  = "TimeToExist"
  w_cap     = 20
}

############################################
# EC2
############################################

aws_ec2 = {
  li_ami    = "ami-022e1a32d3f742bd8"
  li_conn_t = "ssh"
  li_conn_u = "ec2-user"
  li_name   = "ec201"
  li_sleep  = "120s"
  li_type   = "t2.micro"
  wi_ami    = "ami-04132f301c3e4f138"
  wi_name   = "ec202"
  wi_type   = "t2.micro"
}

############################################
# EFS
############################################

aws_efs = {
  name  = "tf-efs"
}

############################################
# KEYS
############################################

aws_key = {
  algo      = "RSA"
  perm      = "0600"
  private   = "aws.pem"
  public    = "tf-aws-key"
}

############################################
# NETWORK ACCESS CONTROL LIST PRIVATE
############################################

aws_nacl_private = {
  name = "tf-nacl-private"
  rules = [
    {
      rule_no    = 1
      action     = "allow"
      protocol   = "-1"
      cidr_block = "10.100.20.0/22"
      from_port  = 0
      to_port    = 0
      egress     = false
    },
    {
      rule_no    = 100
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = false
    },
    {
      rule_no    = 101
      action     = "allow"
      protocol   = "-1"
      cidr_block = "10.100.20.0/22"
      from_port  = 0
      to_port    = 0
      egress     = true
    },
    {
      rule_no    = 200
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = true
    },
  ]
}

############################################
# NETWORK ACCESS CONTROL LIST PUBLIC
############################################

aws_nacl_public = {
  name = "tf-nacl-public"
  rules = [
    {
      rule_no    = 1
      action     = "allow"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = false
    },
    {
      rule_no    = 100
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = false
    },
    {
      rule_no    = 101
      action     = "allow"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = true
    },
    {
      rule_no    = 200
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 0
      egress     = true
    },
  ]
}

############################################
# RDS
############################################

aws_rds = {
  class     = "db.t2.micro"
  engine    = "mysql"
  ident     = "terraform-database-test"
  name      = "tfrds"
  parameter = "default.mysql5.7"
  pass      = "password"
  port      = "3306"
  stg       = 10
  user      = "adminuser"
  version   = "5.7"
}

############################################
# REGION
############################################

aws_region = {
  name      = "us-east-1"
  true      = "true"
}

############################################
# ROUTE TABLE PRIVATE
############################################

aws_rt_private = {
  name    = "tf-rt-private"
}

############################################
# ROUTE TABLE PUBLIC
############################################

aws_rt_public = {
  coringa = "0.0.0.0/0"
  name    = "tf-rt-public"
}

############################################
# S3
############################################

aws_s3 = {
  name     = "tf-s3-clouding-s3"
}

############################################
# SECURITY GROUP PRIVATE
############################################

aws_sg_private = {
  name = "tf-sg-private"
  ingress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.100.20.0/22"]
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.100.20.0/22"]
    }
  ]
}


############################################
# SECURITY GROUP PUBLIC
############################################

aws_sg_public = {
  name = "tf-sg-public"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}


############################################
# SUBNET PRIVATE
############################################

aws_sb_private = {
  cidr      = "10.100.20.0/22"
  name      = "tf-sb-private"
}

############################################
# SUBNET PUBLIC
############################################

aws_sb_public = {
    cidr      = "10.100.21.0/24"
    name      = "tf-sb-public"
}

############################################
# VPC
############################################

aws_vpc = {
  cidr      = "10.100.20.0/22"
  igw       = "tf-ig"
  name      = "tf-vpc"
}