resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = merge(
    var.common_tags, {
        Name = var.vpc_name
    },
  )
}

resource "aws_subnet" "vpc_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.subnet_az
  tags = merge(
    var.common_tags, {
        Name = var.subnet_name
    }
  )
}

resource "aws_security_group" "subnet_sg" {
  name        = "subnet_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.sg_port
    to_port          = var.sg_port
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.subnet_sg.id ]
  subnet_id = aws_subnet.vpc_subnet.id

  tags = merge(
    var.common_tags, {
        Name = var.ec2_name
    }
  )
}