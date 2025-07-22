variable "alb_arn" {
  description = "ARN of the ALB to protect"
  type        = string
}

variable "waf_name" {
  description = "Name for the WAF Web ACL"
  type        = string
  default     = "alb-waf-acl"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}


