############################################
# EFS
############################################

#tfsec:ignore:aws-efs-enable-at-rest-encryption
resource "aws_efs_file_system" "tf_efs" {
  #checkov:skip=CKV_AWS_184: Doesnt need CMK
  creation_token = var.aws_efs.name
  encrypted      = true
  tags = {
    Name = var.aws_efs.name
  }
}

############################################
# MOUNT
############################################

resource "aws_efs_mount_target" "tf_efs_mnt" {
  file_system_id  = aws_efs_file_system.tf_efs.id
  subnet_id       = var.sb_private_id
  security_groups = [var.sg_private_id]
}