############################################
# OUTPUT
############################################

output "internet_gateway_id" {
  value = aws_internet_gateway.tf_ig.id
}

output "sb_private_id" {
  value = aws_subnet.tf_sb_private.id
}

output "sb_public_id" {
  value = aws_subnet.tf_sb_public.id
}

output "vpc_id" {
  value = aws_vpc.tf_vpc.id
}
