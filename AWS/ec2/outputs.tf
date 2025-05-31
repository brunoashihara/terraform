############################################
# OUTPUT
############################################

output "linux_ip" {
  value = aws_instance.ec201.public_ip
}

output "windows_ip" {
  value = aws_instance.ec202.public_ip
}