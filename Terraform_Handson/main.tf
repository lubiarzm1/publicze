resource "aws_vpc" "potezne_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    {
      Name = var.vpc_name
    }
  )
}
resource "aws_subnet" "prajwet" {
  availability_zone = var.region
  cidr_block        = var.cidr
  vpc_id            = aws_vpc.potezne_vpc.id
  tags = merge(
    var.common_tags,
    {
      Name = var.subnet_name
    }
  )
}

resource "aws_security_group" "allow_internety_dla_EC2" {
  name   = "allow_internety_dla_EC2"
  vpc_id = aws_vpc.potezne_vpc.id

  ingress {
    description = "szyfrowanko dla vpc"
    from_port   = var.port
    to_port     = var.port
    protocol    = var.protocol
    cidr_blocks = [aws_vpc.potezne_vpc.cidr_block]
  }
  tags = {
    Name = "allow_internety_dla_EC2"
  }
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_internety_dla_EC2.id]
  subnet_id              = aws_subnet.prajwet.id
  tags = merge(
    var.common_tags,
    {
      Name = "${var.vpc_name}-ec2"
    }
  )
}