terraform {
  required_providers {
    aws = "hashicorp/aws"
    version = "5.54.1"
  }
  backend "s3" {
    bucket = "s3-unique-bucket-"
    key = "<newfile>"
    region = "<aws-region>"
  }
}

provider "aws" {
  region = var.default_region
}

resource "aws_instance" "myserver" {
    ami = "aws-xxxxxx"
    instance_type = "t3.micro"
    tags = {
      Name = "Project server"
    }
}