############################################
# DYNAMODB
############################################

aws_dynamodb = {
  attr_type       = "S"
  billing         = "PROVISIONED"
  hash            = "UserId"
  name            = "tf-dynamodb"
  r_key           = "GameTitle"
  r_cap           = 20
  ttl_name        = "TimeToExist"
  w_cap           = 20
  max_cap         = 100
  min_cap         = 5
  read_scale_dim  = "dynamodb:table:ReadCapacityUnits"
  write_scake_dim = "dynamodb:table:WriteCapacityUnits"
  read_metric     = "DynamoDBReadCapacityUtilization"
  write_metric    = "DynamoDBWriteCapacityUtilization"
  service_ns      = "dynamodb"
  policy          = "TargetTrackingScaling"
  target          = 70
  scale_in        = 60
  scale_out       = 60
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
  name = "tf-efs"
}

############################################
# KEYS
############################################

aws_key = {
  algo    = "RSA"
  perm    = "0600"
  private = "aws.pem"
  public  = "tf-aws-key"
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
      protocol   = "6"
      cidr_block = "10.100.20.0/22"
      from_port  = 2049
      to_port    = 2049
      egress     = false
    },
    {
      rule_no    = 400
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 65535
      egress     = false
    },
    {
      rule_no    = 101
      action     = "allow"
      protocol   = "6"
      cidr_block = "10.100.20.0/22"
      from_port  = 2049
      to_port    = 2049
      egress     = true
    },
    {
      rule_no    = 401
      action     = "deny"
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 65535
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
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 22
      to_port    = 22
      egress     = false
    },
    {
      rule_no    = 2
      action     = "allow"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 3389
      to_port    = 3389
      egress     = false
    },
    {
      rule_no    = 3
      action     = "allow"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 80
      to_port    = 80
      egress     = false
    },
    {
      rule_no    = 4
      action     = "allow"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 443
      to_port    = 443
      egress     = false
    },
    {
      rule_no    = 101
      action     = "allow"
      protocol   = "6"
      cidr_block = "10.100.20.0/22"
      from_port  = 2049
      to_port    = 2049
      egress     = true
    },
    {
      rule_no    = 102
      action     = "allow"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 1024
      to_port    = 65535
      egress     = true
    },
    {
      rule_no    = 103
      action     = "allow"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 443
      to_port    = 443
      egress     = true
    },
    {
      rule_no    = 400
      action     = "deny"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 65535
      egress     = false
    },
    {
      rule_no    = 401
      action     = "deny"
      protocol   = "6"
      cidr_block = "0.0.0.0/0"
      from_port  = 0
      to_port    = 65535
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
  retention = 7
  insights  = true
}

############################################
# REGION
############################################

aws_region = {
  name = "us-east-1"
  true = "true"
}

############################################
# ROUTE TABLE PRIVATE
############################################

aws_rt_private = {
  name = "tf-rt-private"
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
  name = "tf-s3-clouding-s3"
}

############################################
# SECURITY GROUP PRIVATE
############################################

aws_sg_private = {
  name = "tf-sg-private"
  desc = "Security Group for private workloads"
  ingress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.100.20.0/22"]
      description = "Full access from VPC"
    }
  ]
  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.100.20.0/22"]
      description = "Full access from VPC"
    }
  ]
}


############################################
# SECURITY GROUP PUBLIC
############################################

aws_sg_public = {
  name = "tf-sg-public"
  desc = "Security Group for public workloads"
  ingress = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH from home"
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "RDP from home"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP from home"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS from home"
    }
  ]
  egress = [
    {
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = ["10.100.20.0/22"]
      description = "EFS to private connection"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Access to Internet and updates"
    }
  ]
}


############################################
# SUBNET PRIVATE
############################################

aws_sb_private = {
  cidr = "10.100.20.0/22"
  name = "tf-sb-private"
}

############################################
# SUBNET PUBLIC
############################################

aws_sb_public = {
  cidr = "10.100.21.0/24"
  name = "tf-sb-public"
}

############################################
# VPC
############################################

aws_vpc = {
  cidr = "10.100.20.0/22"
  igw  = "tf-ig"
  name = "tf-vpc"
}