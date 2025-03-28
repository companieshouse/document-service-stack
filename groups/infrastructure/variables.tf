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

variable "cert_domain" {
  type        = string
  description = "The certificate domain to use."
}

# EC2
variable "ec2_instance_type" {
  default     = "t3.medium"
  type        = string
  description = "The instance type for ec2 instances in the clusters."
}

# Auto-scaling Group
variable "asg_max_instance_count" {
  default     = 0
  type        = number
  description = "The maximum allowed number of instances in the autoscaling group for the cluster."
}

variable "asg_min_instance_count" {
  default     = 0
  type        = number
  description = "The minimum allowed number of instances in the autoscaling group for the cluster."
}

variable "asg_desired_instance_count" {
  default     = 0
  type        = number
  description = "The desired number of instances in the autoscaling group for the cluster. Must fall within the min/max instance count range."
}

variable "asg_scaledown_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling down the number of EC2 instances to zero."
}

variable "asg_scaleup_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling up the number of EC2 instances to their normal desired level."
}

variable "enable_asg_autoscaling" {
  default     = true
  type        = bool
  description = "Whether to enable auto-scaling of the ASG by creating a capacity provider for the ECS cluster."
}

# Container Insights - ECS
variable "enable_container_insights" {
  type        = bool
  description = "A boolean value indicating whether to enable Container Insights or not"
  default     = true
}

variable "frontend_document_api_create_alb" {
  type        = bool
  description = "Override with value false if this ELB is not required in the environment"
  default     = true
}

variable "frontend_document_api_create_internal_alb" {
  type        = bool
  description = "Override with value false if this ELB is required as internet facing in the environment"
  default     = true
}

variable "backend_document_api_create_alb" {
  type        = bool
  description = "Override with value false if this ALB is not required in the environment"
  default     = true
}

variable "backend_document_api_create_internal_alb" {
  type        = bool
  description = "Override with value false if this ELB is required as internet facing in the environment"
  default     = true
}

# DNS
variable "frontend_route53_aliases" {
  type        = list(string)
  description = "The Route53 aliases to create."
  default     = []
}

variable "backend_route53_aliases" {
  type        = list(string)
  description = "The Route53 aliases to create."
  default     = []
}

variable "route53_domain_name" {
  type        = string
  description = "The type level of the DNS domain for internal access."
  default     = ""
}

# ----------------------------------------------------------------------
# Loadbalancers
# ----------------------------------------------------------------------
variable "frontend_lb_name" {
  type        = string
  description = "The frontend Loadbalancer name"
}

variable "backend_lb_name" {
  type        = string
  description = "The backend Loadbalancer name"
}
