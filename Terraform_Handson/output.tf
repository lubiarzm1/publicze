output "EC2_IP" {
  value = aws_instance.ec2.private_ip
}