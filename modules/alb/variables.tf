variable "vpc_id" {
  description = "VPC ID for ALB"
  type        = string
}

variable "subnets" {
  description = "Subnet IDs for ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security Group IDs for ALB"
  type        = list(string)
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}