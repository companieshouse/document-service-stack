locals {
  stack_name                      = "document"
  stack_fullname                  = "${local.stack_name}-service-stack"
  service_name                    = "document-api"
  aws_s3_bucket_acl_permissions   = var.aws_s3_bucket_acl_permissions
  create_aws_s3_bucket_lifecycle_configuration = (var.aws_profile == "live-eu-west-2" && var.environment == "live") ? true : false
}
