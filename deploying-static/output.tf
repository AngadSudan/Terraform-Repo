output "site_url" {
  value = aws_s3_bucket_website_configuration.website_hosting.website_endpoint
}