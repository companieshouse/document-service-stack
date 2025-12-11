# Environment
variable "environment" {
  type        = string
  description = "The environment name, defined in envrionments vars."
}

variable "aws_region" {
  default     = "eu-west-2"
  type        = string
  description = "The AWS region for deployment."
}

variable "aws_profile" {
  default     = "development-eu-west-2"
  type        = string
  description = "The AWS profile to use for deployment."
}

variable "document_api_chips_bucket" {
  type        = string
  description = "The S3 bucket for CHIPS."
}

variable "document_api_images_bucket" {
  type        = string
  description = "The S3 bucket for Document API."
}

variable "aws_s3_bucket_acl_permissions" {
  type        = list(string)
  description = "The AWS S3 Bucket ACL permissions list."
  default     = [ "FULL_CONTROL" ]
}
