############################################
# SG PRIVATE
############################################

resource "aws_security_group" "tf_sg_private" {
  #checkov:skip=CKV2_AWS_5: Security Group is used in the EC2 module
  name        = var.aws_sg_private.name
  description = var.aws_sg_private.desc
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.aws_sg_private.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  dynamic "egress" {
    for_each = var.aws_sg_private.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  tags = {
    Name = var.aws_sg_private.name
  }
}


############################################
# SG PUBLIC
############################################

# tfsec:ignore:aws-ec2-no-public-egress-sgr
resource "aws_security_group" "tf_sg_public" {
  #checkov:skip=CKV2_AWS_5: Security Group is used in the EC2 module
  name        = var.aws_sg_public.name
  description = var.aws_sg_public.desc
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.aws_sg_public.ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  dynamic "egress" {
    for_each = var.aws_sg_public.egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  tags = {
    Name = var.aws_sg_public.name
  }
}
