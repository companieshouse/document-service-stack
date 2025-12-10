terraform {
  backend "s3" {}
  required_version = ">= 1.3, < 2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 6.0"
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
  bucket = var.document_api_chips_bucket
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
  bucket = var.document_api_images_bucket

  tags = {
    Environment = var.environment
    Name        = "Document API"
    StackName   = local.stack_name
  }

  tags_all = {
    Environment = var.environment
    Name        = "Document API"
    StackName   = local.stack_name
  }

}

resource "aws_s3_bucket_acl" "document_api_bucket" {
  bucket     = aws_s3_bucket.document_api_bucket.id
  access_control_policy {
    dynamic "grant" {
      for_each = local.aws_s3_bucket_acl_permissions
      content {
        grantee {
          id   = data.aws_canonical_user_id.current.id
          type = "CanonicalUser"
        }
        permission = grant.value
      }
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}
