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
# DynamoDB Tables
# ---------------------------

resource "aws_dynamodb_table" "document_api_metadata_table" {
  name           = "document-api-metadata-${var.environment}"
  billing_mode   = var.billing_mode "PROVISIONED"
  read_capacity  = var.throughput
  write_capacity = var.throughput
  hash_key       = "DocumentID"

  attribute {
    name = "DocumentID"
    type = "S"
  }

}

resource "aws_dynamodb_table" "document_api_resources_table" {
  name           = "document-api-resources-${var.environment}"
  billing_mode   = var.billing_mode
  read_capacity  = var.throughput
  write_capacity = var.throughput
  hash_key       = "DocumentID"
  range_key      = "ContentType"

  attribute {
    name = "DocumentID"
    type = "S"
  }

  attribute {
    name = "ContentType"
    type = "S"
  }

}

