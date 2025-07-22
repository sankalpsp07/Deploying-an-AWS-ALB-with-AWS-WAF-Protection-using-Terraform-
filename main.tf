module "alb_sg" {
  source      = "./modules/security_groups"
  vpc_id      = data.aws_vpc.default.id
  environment = var.environment
  description = "Security group for application load balancer"
  
  # Customize rules if needed:
  ingress_rules = [
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
    # Add more rules as needed
  ]
}

module "alb" {
  source          = "./modules/alb"
  vpc_id          = data.aws_vpc.default.id
  subnets         = data.aws_subnets.default.ids
  security_groups = [module.alb_sg.security_group_id]
}

module "waf" {
  source    = "./modules/waf"
  alb_arn   = module.alb.alb_arn
  waf_name  = "alb-waf-acl"
}



