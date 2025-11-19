variable "site_bucket" {
    description = "the s3 bucket name containing the site resources"
    type = string
    default = "cathycodes.com"
}

variable "region" {
    description = "the AWS region"
    type = string
    default = "us-east-1"
}

