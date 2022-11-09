variable "vpc_cidr" {
  type = string
  description = "Value of CIDR vpc"
}

variable "vpc_name" {
  type = string
  description = "Name of vpc"
}

variable "subnet_cidr"{
    type = string
    description = "Value of CIDR subnet"
}

variable "subnet_name"{
    type = string
    description = "Name subnet"
}

variable "subnet_az"{
    type = string
    description = "Used AZ"
}

variable "sg_port" {
    type = number
    description = "Enabled port on security groupe"
}

variable "ec2_name" {
    type = string
    description = "name of EC2 name"
}

variable "common_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}