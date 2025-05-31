############################################
# NACL PRIVATE
############################################

resource "aws_network_acl" "tf_nacl_private" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.aws_nacl_private.name
  }
}

############################################
# NACL PUBLIC
############################################

resource "aws_network_acl" "tf_nacl_public" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.aws_nacl_public.name
  }
}

############################################
# NACL PRIVATE RULES
############################################

resource "aws_network_acl_rule" "tf_nacl_private_rules" {
  for_each = { for r in var.aws_nacl_private.rules : r.rule_no => r }

  network_acl_id = aws_network_acl.tf_nacl_private.id
  rule_number    = each.value.rule_no
  rule_action    = each.value.action
  protocol       = each.value.protocol
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
  egress         = each.value.egress
}

############################################
# NACL PUBLIC RULES
############################################

resource "aws_network_acl_rule" "tf_nacl_public_rules" {
  for_each = { for r in var.aws_nacl_public.rules : r.rule_no => r }

  network_acl_id = aws_network_acl.tf_nacl_public.id
  rule_number    = each.value.rule_no
  rule_action    = each.value.action
  protocol       = each.value.protocol
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
  egress         = each.value.egress
}

############################################
# NACL ASSOCIATION PRIVATE
############################################

resource "aws_network_acl_association" "tf_nacl_private_association" {
  network_acl_id = aws_network_acl.tf_nacl_private.id
  subnet_id      = var.sb_private_id
}

############################################
# NACL ASSOCIATION PUBLIC
############################################

resource "aws_network_acl_association" "tf_nacl_public_association" {
  network_acl_id = aws_network_acl.tf_nacl_public.id
  subnet_id      = var.sb_public_id
}
