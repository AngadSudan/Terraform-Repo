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
  backend "s3" {
    bucket = "<pre-existing-s3-bucket>"
  }
}

provider "aws" {
  region = var.default_region
}

resource "random_id" "random_uuid" {
    byte_length = 8
}

resource "aws_s3_bucket" "aws_bucket" {
  bucket = var.default_bucket 
}

resource "aws_s3_bucket_public_access_block" "public_policy" {
  bucket = aws_s3_bucket.aws_bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false 
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_access_policy" {
  bucket = aws_s3_bucket.aws_bucket.id
  policy = jsonencode(
     {
      Version = "2012-10-17",
      Statement = [
        {
          Sid       = "PublicReadGetObject",
          Effect    = "Allow",
          Principal = "*",
          Action    = "s3:GetObject",
          Resource  = "${aws_s3_bucket.aws_bucket.arn}/*"
        }
      ]
  })
}

resource "aws_s3_bucket_website_configuration" "website_hosting" {
  bucket = aws_s3_bucket.aws_bucket.id
  index_document {
    suffix = "index.html"
  }
}


resource "aws_s3_object" "s3_html_file" {
    bucket = var.default_bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
}
resource "aws_s3_object" "s3_css_file" {
    bucket = var.default_bucket
    source = "./style.css"
    key = "style.css"
    content_type = "text/html"
}

