output "output_url" {
  value = "https://${aws_instance.aws_ec2.public_dns}"
}