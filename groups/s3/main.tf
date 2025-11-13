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

resource "aws_s3_bucket" "chips_bucket" {
  bucket = "document-api-chips-${var.environment}"
}

resource "aws_s3_bucket_acl" "chips_bucket" {
  bucket     = aws_s3_bucket.chips_bucket.id

  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}


# ----------------------------------------

resource "aws_s3_bucket" "document_api_bucket" {
  bucket = "document-api-images-${var.environment}"
}


resource "aws_s3_bucket_acl" "document_api_bucket" {
  bucket     = aws_s3_bucket.document_api_bucket.id
  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}
