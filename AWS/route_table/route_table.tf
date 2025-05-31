############################################
# RT PRIVATE
############################################

resource "aws_route_table" "tf_rt_private" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.aws_rt_private.name
  }
}

############################################
# RT PUBLIC
############################################

resource "aws_route_table" "tf_rt_public" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.aws_rt_public.coringa
    gateway_id = var.internet_gateway_id
  }
  tags = {
    Name = var.aws_rt_public.name
  }
}

############################################
# RT ASSOCIATION PUBLIC
############################################

resource "aws_route_table_association" "tf_rta_private" {
  subnet_id      = var.sb_private_id
  route_table_id = aws_route_table.tf_rt_private.id
}

############################################
# RT ASSOCIATION PUBLIC
############################################

resource "aws_route_table_association" "tf_rta_public" {
  subnet_id      = var.sb_public_id
  route_table_id = aws_route_table.tf_rt_public.id
}