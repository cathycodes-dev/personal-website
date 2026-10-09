terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
  default_tags {
    tags = {
      Owner       = "${var.owner}"
      Project     = "${var.project_name}"
      Environment = "${var.environment}"
      ManagedBy   = "Terraform"
    }
  }
}

# 1. Request Wildcard Certificate
resource "aws_acm_certificate" "wildcard_cert" {
  provider                  = aws.us_east_1
  domain_name               = "cathycodes.com"
  subject_alternative_names = ["*.cathycodes.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# 2. Route 53 DNS Validation Records
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.wildcard_cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.main.zone_id
}

# 3. Validate Certificate
resource "aws_acm_certificate_validation" "wildcard_cert" {
  provider                = aws.us_east_1
  certificate_arn         = aws_acm_certificate.wildcard_cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
}
