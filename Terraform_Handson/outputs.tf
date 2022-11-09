output "IP_EC2" {
  value = aws_instance.ec2.private_ip
}