# =========================================
# S3 BUCKET
# =========================================
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = var.tags
}

# =========================================
# BLOCK PUBLIC ACCESS
# =========================================
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

# =========================================
# VERSIONING
# =========================================
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

# =========================================
# ENCRYPTION (AES256 - SSE-S3)
# =========================================
# tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# =========================================
# BUCKET POLICY
# =========================================
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "EnforceTLS"
        Effect = "Deny"
        Principal = "*"
        Action = "s3:*"

        Resource = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*"
        ]

        Condition = {
          Bool = {
            "aws:SecureTransport" = false
          }
        }
      },
      {
        Sid = "DenyUnencryptedObjectUploads"
        Effect = "Deny"
        Principal = "*"
        Action = "s3:PutObject"
        Resource = "${aws_s3_bucket.this.arn}/*"

        Condition = {
          StringNotEqualsIfExists = {
            "s3:x-amz-server-side-encryption" = "AES256"
          }
        }
      }
    ]
  })
}

# =========================================
# LOGGING
# =========================================
resource "aws_s3_bucket_logging" "this" {
  count = var.enable_logging && var.logging_target_bucket != "" ? 1 : 0

  bucket = aws_s3_bucket.this.id
  target_bucket = var.logging_target_bucket
  target_prefix = "access-logs/${var.bucket_name}/"
}

# =========================================
# LIFECYCLE
# =========================================
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id = "lifecycle-${var.environment}"
    status = "Enabled"

    filter {}

    expiration {
      days = var.lifecycle_days
    }
  }
}
