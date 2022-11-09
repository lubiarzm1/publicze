variable "vpc_name" {
  type        = string
  description = "Nazwa VPC"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The primary IPv4 CIDR block for the VPC."
}
variable "port" {
  type        = number
  description = "Port do obslugi"
}
variable "cidr" {
  type        = string
  description = "cidr do subneta"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}
variable "protocol" {
  type        = string
  description = "Protocol used to communication"
}

variable "region" {
  type        = string
  description = "Name of the region where deploying"
}

variable "common_tags" {
  type        = map(string)
  description = "Common resource tags"
  default     = {}
}