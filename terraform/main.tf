terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "test-terraform"
}

resource "aws_s3_object_copy" "object" {
    bucket = aws_s3_bucket.test.bucket
    key = "index.html"
    source = "./site/index.html"
}