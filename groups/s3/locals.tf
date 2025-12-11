locals {
  stack_name                      = "document"
  stack_fullname                  = "${local.stack_name}-service-stack"
  service_name                    = "document-api"
  aws_s3_bucket_acl_permissions   = var.aws_s3_bucket_acl_permissions
}
