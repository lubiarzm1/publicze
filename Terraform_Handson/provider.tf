terraform {
  backend "s3" {
    encrypt = true
  }
  required_version = ">= 1.2.1"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}