terraform {
  required_providers {
    aws = {
      source= "hashicorp/aws"
      version = "5.54.1"
    }
    random_id = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

resource "random_id" "random_id" {
    byte_length = 8
}

provider "aws" {
  region = var.default_region
}

resource "aws_s3_bucket" "aws-bucket" {
    bucket = "aws-unique-s3-bucket-${random_id.random_id.id}"
    tags = {
        Name = "aws-s3-bucket"
    }
}

resource "aws_s3_object" "aws-object-1" {
    bucket = aws_s3_bucket.aws-bucket
    source = "./upload.txt"
    key = "terraformUpload.txt"
}