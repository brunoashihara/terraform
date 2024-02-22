############################################
# SLEEP TIME
############################################

resource "time_sleep" "wait_120_seconds" {
  depends_on = [
    aws_efs_mount_target.teste_efs_mnt
  ]
  create_duration = var.ec2.li_sleep
}

############################################
# EC2 LINUX
############################################

resource "aws_instance" "teste_linux" {
  depends_on = [
    time_sleep.wait_120_seconds
  ]
  ami                         = var.ec2.li_ami
  instance_type               = var.ec2.li_type
  key_name                    = aws_key_pair.teste_kp.key_name
  subnet_id                   = aws_subnet.teste_sb_public.id
  vpc_security_group_ids      = [aws_security_group.teste_sg_public.id]
  associate_public_ip_address = true
  tags = {
    Name = var.ec2.li_name
  }
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /mnt/efs",
      "sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${aws_efs_file_system.teste_efs.dns_name}:/ /mnt/efs",
      "sudo su -c \"echo '${aws_efs_file_system.teste_efs.dns_name}:/ /mnt/efs nfs4 defaults,vers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 0 0' >> /etc/fstab\""
    ]
  }
  connection {
    type        = var.ec2.li_conn_t
    user        = var.ec2.li_conn_u
    private_key = tls_private_key.teste_aws_key.private_key_pem
    host        = self.public_ip
  }
}

############################################
# EC2 WINDOWS
############################################

resource "aws_instance" "teste_windows" {
  ami                         = var.ec2.wi_ami
  instance_type               = var.ec2.wi_type
  key_name                    = aws_key_pair.teste_kp.key_name
  subnet_id                   = aws_subnet.teste_sb_public.id
  vpc_security_group_ids      = [aws_security_group.teste_sg_public.id]
  associate_public_ip_address = true
  tags = {
    Name = var.ec2.wi_name
  }
}
