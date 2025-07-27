terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "5.54.1"
    }
    random_id = {
        source = "hashicorp/random"
        version = "3.6.1"
    }
  }
}
