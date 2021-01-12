# Terraform Module Github
# https://github.com/terraform-aws-modules/terraform-aws-alb

## Random func

# Create VPC
module "alb" {
  source = "../.terraform/modules/alb"
  #source  = "terraform-aws-modules/alb/aws"

  name = var.lb_name

  load_balancer_type = var.load_balancer_type

  vpc_id          = data.aws_vpc.seleted.id
  subnets         = data.aws_subnet_ids.public.ids
  security_groups = [data.aws_security_group.sg-https.id]

  #  access_logs = {
  #    bucket = "my-alb-logs"
  #  }

  target_groups = [
    {
      name_prefix          = var.name_prefix
      backend_protocol     = var.backend_protocol
      backend_port         = var.backend_port
      target_type          = var.target_type
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = var.interval
        path                = var.path
        port                = var.port
        healthy_threshold   = var.healthy_threshold
        unhealthy_threshold = var.unhealthy_threshold
        timeout             = var.timeout
        protocol            = var.protocol
        matcher             = var.matcher
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.aws_acm_certificate.selected.arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    "TerraformManaged" = "true"
  }
}
