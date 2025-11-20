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

# ---------------------------
# Variables
# ---------------------------

variable "throughput" {
  type        = number
  default     = 2
  description = "Throughput for DynamoDB tables"
}