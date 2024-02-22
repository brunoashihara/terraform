############################################
# EFS
############################################

resource "aws_efs_file_system" "teste_efs" {
  creation_token = var.efs_name
  tags = {
    Name = var.efs_name
  }
}

############################################
# MOUNT
############################################

resource "aws_efs_mount_target" "teste_efs_mnt" {
  file_system_id  = aws_efs_file_system.teste_efs.id
  subnet_id       = aws_subnet.teste_sb_public.id
  security_groups = [aws_security_group.teste_sg_public.id]
}