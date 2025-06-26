############################################
# VPC
############################################

#tfsec:ignore:aws-ec2-require-vpc-flow-logs-for-all-vpcs
resource "aws_vpc" "tf_vpc" {
  #checkov:skip=CKV2_AWS_11: Doesnt need flow logs
  #checkov:skip=CKV2_AWS_12: Default SG is not used the custom SGs are attached in other modules
  cidr_block           = var.aws_vpc.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.aws_vpc.name
  }
}

############################################
# SB PRIVATE
############################################

resource "aws_subnet" "tf_sb_private" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = var.aws_sb_private.cidr
  tags = {
    Name = var.aws_sb_private.name
  }
}

############################################
# SB PUBLIC
############################################

resource "aws_subnet" "tf_sb_public" {
  vpc_id     = aws_vpc.tf_vpc.id
  cidr_block = var.aws_sb_public.cidr
  tags = {
    Name = var.aws_sb_public.name
  }
}


############################################
# IGW
############################################

resource "aws_internet_gateway" "tf_ig" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = var.aws_vpc.igw
  }
}