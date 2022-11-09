terraform {
  backend "s3" {
    encrypt = true
  }
}
provider "aws" {
    version = "~> 4.0"
    profile = "default"
    region = "eu-west-1"
}