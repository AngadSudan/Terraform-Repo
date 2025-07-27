variable "default_region" {
  default = "eu-north-1"
  description = "default region for aws"
  type = string
}
variable "default_bucket" {
  default = "aws_s3_instance-${random_uuid.random_uuid}" 
  description = "default bucket for aws website"
  type = string
}