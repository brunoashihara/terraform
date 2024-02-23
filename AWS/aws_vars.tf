############################################
# REGION
############################################

variable "region" {
  description = " Variaveis da região"
  default     = {
    name    = "us-east-1"
    true      = "true"
  }
}

############################################
# DYNAMODB
############################################

variable "dynamodb" {
  description = "Variaveis dynamodb"
  default     = {
    name      = "teste-dynamodb"
    billing   = "PROVISIONED"
    r_cap     = 20
    w_cap     = 20
    hash      = "UserId"
    r_key     = "GameTitle"
    attr_type = "S"
    ttl_name  = "TimeToExist"
  }
}

############################################
# EC2
############################################

variable "ec2" {
  description = "Variaveis EC2"
  default     = {
    li_sleep  = "120s"
    li_name   = "teste-linux"
    li_ami    = "ami-022e1a32d3f742bd8"
    li_type   = "t2.micro"
    li_conn_t = "ssh"
    li_conn_u = "ec2-user"
    wi_name   = "teste-windows"
    wi_ami    = "ami-04132f301c3e4f138"
    wi_type   = "t2.micro"
  }
}

############################################
# EFS
############################################

variable "efs_name" {
  description = "Variavel name efs"
  type        = string
  default     = "teste-efs"
}

############################################
# KEYS
############################################

variable "kp" {
  description = "Variavel algorithm key pair"
  default     = {
    algo      = "RSA"
    private   = "teste-aws-key.pem"
    perm      = "0600"
    public    = "teste-aws-key"
  }
}

############################################
# RDS
############################################

variable "rds" {
  description = "Variaveis rds"
  default     = {
    name      = "testerds"
    stg       = 10
    engine    = "mysql"
    version   = "5.7"
    class     = "db.t2.micro"
    user      = "adminuser"
    pass      = "password"
    port      = "3306"
    parameter = "default.mysql5.7"
    ident     = "terraform-database-test"
  }
}

############################################
# S3
############################################

variable "s3_bucket_name" {
  description = "Variavel bucket name s3"
  type        = string
  default     = "teste-s3-clouding-s3"
}

############################################
# VPC
############################################

variable "vpc" {
  description = "Variaveis vpc"
  default     = {
    coringa   = "0.0.0.0/0
    name      = "teste-vpc"
    cidr      = "192.168.0.0/22"
    igw       = "teste-ig"
    rt        = "teste-rt-public"
    protocol  = "all"
  }
}

############################################
# SUBNET
############################################

variable "sb_public" {
  description = "Variaveis sb public"
  default     = {
    name      = "teste-sb-public"
    cidr      = "192.168.0.0/24"
  }
}

variable "sb_private" {
  description = "Variaveis sb private"
  default     = {
    name      = "teste-sb-private"
    cidr      = "192.168.1.0/24"

  }
}

############################################
# SECURITY GROUP
############################################

variable "sg_public" {
  description = "Variaveis sg public"
  default     = {
    name      = "teste-sg-public"
    tcp       = "tcp"
    udp       = "udp"
    icmp      = "icmp"
    web       = 80
    web_ssl   = 443
    ssh       = 22
    rdp       = 3389
    nfs       = 2049
    coringa   = 0
  }
}

############################################
# NETWORK ACCESS CONTROL LIST
############################################

variable "nacl_public" {
  description = "Variaveis nacl public"
  default     = {
    name      = "teste-nacl-public"
    protocol  = "all"
    rule1     = "1"
    rule100   = "100"
    allow     = "allow"
    deny      = "deny"
  }
}
