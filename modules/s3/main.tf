provider "aws" {
  region = var.region  
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = var.Sid
        Effect    = var.Effect
        Principal = var.Principal
        Action    = var.Action
        Resource  = "${aws_s3_bucket.this.arn}/*"
      },
      
      {
        Sid       = "AllowAWSConfig"
        Effect    = "Allow"
        Principal = {
          Service = "config.amazonaws.com"
        }
        Action    = [
          "s3:PutObject",
          "s3:GetBucketAcl"
        ]
        Resource  = [
          "${aws_s3_bucket.this.arn}/aws-config/*",  # Allow write to the aws-config path
          "${aws_s3_bucket.this.arn}"  # Allow access to the bucket ACL itself
        ]
      }
    ]
  })
   depends_on = [aws_s3_bucket_public_access_block.this]
}