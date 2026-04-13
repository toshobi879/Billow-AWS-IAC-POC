variable "backend_bucket_name" {
  description = "S3 bucket name for Terraform state"
  type        = string
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/uat/prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

