############################################
# VPC
############################################

resource "aws_vpc" "teste_vpc" {
  cidr_block           = var.vpc.cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc.name
  }
}

############################################
# SG PUBLIC
############################################

resource "aws_subnet" "teste_sb_public" {
  vpc_id     = aws_vpc.teste_vpc.id
  cidr_block = var.sb_public.cidr
  tags = {
    Name = var.sb_public.name
  }
}

############################################
# SG PRIVATE
############################################

resource "aws_subnet" "teste_sb_private" {
  vpc_id     = aws_vpc.teste_vpc.id
  cidr_block = var.sb_private.cidr
  tags = {
    Name = var.sb_private.name
  }
}

############################################
# IGW
############################################

resource "aws_internet_gateway" "teste_ig" {
  vpc_id = aws_vpc.teste_vpc.id
  tags = {
    Name = var.vpc.igw
  }
}

############################################
# RT
############################################

resource "aws_route_table" "teste_rt_public" {
  vpc_id = aws_vpc.teste_vpc.id
  route {
    cidr_block = var.vpc.coringa
    gateway_id = aws_internet_gateway.teste_ig.id
  }
  tags = {
    Name = var.vpc.rt
  }
}

############################################
# RT ASSOCIATION
############################################

resource "aws_route_table_association" "teste_rta_public" {
  subnet_id      = aws_subnet.teste_sb_public.id
  route_table_id = aws_route_table.teste_rt_public.id
}

############################################
# SG PUBLIC
############################################

resource "aws_security_group" "teste_sg_public" {
  name   = var.sg_public.name
  vpc_id = aws_vpc.teste_vpc.id
  ingress {
    from_port   = var.sg_public.web
    to_port     = var.sg_public.web
    protocol    = var.sg_public.tcp
    cidr_blocks = [var.vpc.coringa]
  }
  ingress {
    from_port   = var.sg_public.web_ssl
    to_port     = var.sg_public.web_ssl
    protocol    = var.sg_public.tcp
    cidr_blocks = [var.vpc.coringa]
  }
  ingress {
    from_port   = var.sg_public.ssh
    to_port     = var.sg_public.ssh
    protocol    = var.sg_public.tcp
    cidr_blocks = [var.vpc.coringa]
  }
  ingress {
    from_port   = var.sg_public.rdp
    to_port     = var.sg_public.rdp
    protocol    = var.sg_public.tcp
    cidr_blocks = [var.vpc.coringa]
  }
  ingress {
    from_port   = var.sg_public.nfs
    to_port     = var.sg_public.nfs
    protocol    = var.sg_public.tcp
    cidr_blocks = [var.vpc.coringa]
  }
  egress {
    from_port   = var.sg_public.protocol
    to_port     = var.sg_public.protocol
    protocol    = var.vpc.protocol
    cidr_blocks = [var.vpc.coringa]
  }
  tags = {
    Name = var.sg_public.name
  }
}

############################################
# NACL PUBLIC
############################################

resource "aws_network_acl" "teste_nacl_public" {
  vpc_id = aws_vpc.teste_vpc.id
  egress {
    protocol   = var.nacl_public.protocol
    rule_no    = var.nacl_public.rule1
    action     = var.nacl_public.allow
    cidr_block = var.vpc.coringa
    from_port  = var.sg_public.coringa
    to_port    = var.sg_public.coringa
  }
  egress {
    protocol   = var.nacl_public.protocol
    rule_no    = var.nacl_public.rule100
    action     = var.nacl_public.deny
    cidr_block = var.vpc.coringa
    from_port  = var.sg_public.coringa
    to_port    = var.sg_public.coringa
  }
  ingress {
    protocol   = var.nacl_public.protocol
    rule_no    = var.nacl_public.rule1
    action     = var.nacl_public.allow
    cidr_block = var.vpc.coringa
    from_port  = var.sg_public.coringa
    to_port    = var.sg_public.coringa
  }
  ingress {
    protocol   = var.nacl_public.protocol
    rule_no    = var.nacl_public.rule100
    action     = var.nacl_public.deny
    cidr_block = var.vpc.coringa
    from_port  = var.sg_public.coringa
    to_port    = var.sg_public.coringa
  }
  tags = {
    Name = var.nacl_public.name
  }
}

############################################
# NACL ASSOCIATION
############################################

resource "aws_network_acl_association" "teste_nacl_association" {
  network_acl_id = aws_network_acl.teste_nacl_public.id
  subnet_id      = aws_subnet.teste_sb_public.id
}