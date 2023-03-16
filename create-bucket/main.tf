provider "aws" {
  region = "us-east-1"
}

resource "random_string" "suffix" {
  length = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "backend" {
  bucket = "tfstate-${random_string.suffix.id}"
  force_destroy = true
}

output "config" {
  value = aws_s3_bucket.backend.id
}