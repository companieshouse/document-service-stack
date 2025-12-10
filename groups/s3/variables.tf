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

variable "chips_bucket_name" {
  type        = string
  description = "The S3 bucket for CHIPS."
}

variable "document_api_bucket" {
  type        = string
  description = "The S3 bucket for Document API."
}
