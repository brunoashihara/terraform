############################################
# SLEEP TIME
############################################

resource "time_sleep" "wait_120_seconds" {
  create_duration = var.aws_ec2.li_sleep
}


############################################
# EC2 LINUX
############################################

#tfsec:ignore:aws-ec2-enable-at-rest-encryption  tfsec:ignore:aws-ec2-enforce-http-token-imds
resource "aws_instance" "ec201" {
  #checkov:skip=CKV_AWS_88: Need public IP to access Internet
  #checkov:skip=CKV2_AWS_41: For this project I will skip the role
  depends_on = [
    time_sleep.wait_120_seconds
  ]
  ami                         = var.aws_ec2.li_ami
  instance_type               = var.aws_ec2.li_type
  key_name                    = var.key_name
  subnet_id                   = var.sb_public_id
  vpc_security_group_ids      = [var.sg_public_id]
  associate_public_ip_address = true
  ebs_optimized               = true
  monitoring                  = true
  root_block_device {
    encrypted = true
  }
  tags = {
    Name = var.aws_ec2.li_name
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /mnt/efs",
      "sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${var.efs_dns}:/ /mnt/efs",
      "sudo su -c \"echo '${var.efs_dns}:/ /mnt/efs nfs4 defaults,vers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 0 0' >> /etc/fstab\""
    ]
  }
  connection {
    type        = var.aws_ec2.li_conn_t
    user        = var.aws_ec2.li_conn_u
    private_key = var.private_key_pem
    host        = self.public_ip
  }
  metadata_options {
    http_tokens = "required"
  }
}

############################################
# EC2 WINDOWS
############################################

#tfsec:ignore:aws-ec2-enforce-http-token-imds tfsec:ignore:aws-ec2-enable-at-rest-encryption
resource "aws_instance" "ec202" {
  #checkov:skip=CKV_AWS_88: Need public IP to access Internet
  #checkov:skip=CKV2_AWS_41: For this project I will skip the role
  ami                         = var.aws_ec2.wi_ami
  instance_type               = var.aws_ec2.wi_type
  key_name                    = var.key_name
  subnet_id                   = var.sb_public_id
  vpc_security_group_ids      = [var.sg_public_id]
  associate_public_ip_address = true
  ebs_optimized               = true
  monitoring                  = true
  root_block_device {
    encrypted = true
  }
  tags = {
    Name = var.aws_ec2.wi_name
  }
  metadata_options {
    http_tokens = "required"
  }
}
