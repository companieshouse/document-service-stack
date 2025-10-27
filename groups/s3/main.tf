terraform {
  backend "s3" {}
  required_version = ">= 1.3, < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.0, < 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}

# ---------------------------
# S3 Buckets
# ---------------------------

# ---------------------------
# S3 Buckets (modern standard)
# ---------------------------

resource "aws_s3_bucket" "document_api_bucket" {
  bucket = "document-api-images-${var.username}"

  tags = {
    Name        = "document-api-images-${var.username}"
    Environment = var.username
  }
}

resource "aws_s3_bucket_ownership_controls" "document_api_bucket" {
  bucket = aws_s3_bucket.document_api_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "document_api_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.document_api_bucket]
  bucket     = aws_s3_bucket.document_api_bucket.id
  acl        = "private"
}
