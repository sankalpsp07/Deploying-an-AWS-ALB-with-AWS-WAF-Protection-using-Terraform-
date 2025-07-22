variable "vpc_id" {
  description = "VPC ID for security group"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "ALB Security Group"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    description = string
    port        = number
    cidr_blocks = list(string)
  }))
  default = [
    {
      description = "HTTP"
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "HTTPS"
      port        = 443
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
