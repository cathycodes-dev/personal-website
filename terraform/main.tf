terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Owner       = "${var.owner}"
      Project     = "${var.project_name}"
      Environment = "${var.environment}"
    }
  }
}

