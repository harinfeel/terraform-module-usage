## DNS Name
domain_name        = "cloudev.cf"
lb_name            = "alb-gitlab-public"
load_balancer_type = "application"
internal           = false

## Target Groups
name_prefix      = "tg-443"
backend_protocol = "HTTP"
backend_port     = 80
target_type      = "instance"

## Target Group health check
interval            = 30
path                = "/"
port                = "80"
healthy_threshold   = "5"
unhealthy_threshold = "2"
timeout             = "5"
protocol            = "HTTP"
matcher             = "200"
