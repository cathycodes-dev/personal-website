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

variable "owner" {
  type    = string
  default = "Cathy-Codes"
}

variable "project_name" {
  type    = string
  default = "personal-website"
}

variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}