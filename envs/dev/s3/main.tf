module "s3" {
  source = "../../../modules/s3"

  bucket_name        = var.bucket_name
  versioning_enabled = var.versioning_enabled

  enable_logging        = var.enable_logging
  logging_target_bucket = var.logging_target_bucket

  lifecycle_days = var.lifecycle_days
  environment    = var.environment
}
