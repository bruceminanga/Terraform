terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "hello_world" {
  bucket = "my-awesome-hello-world-bucket-xyz123"

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

output "bucket_arn" {
  description = "The ARN of the provisioned bucket"
  value       = aws_s3_bucket.hello_world.arn
}
