terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.54.1"
      }
    }
}

provider "aws" {
  region = var.default-region
}

resource "aws_instance" "server" {
  ami = "ami-xxxxxxxx"
  instance_type = "t3.micro"
  tags = {
    Name = "aws-server-ec2"
  }
}