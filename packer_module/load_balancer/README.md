# AWS Load Balancer, Target Group, and Listener Terraform Module

This Terraform module provisions an **AWS Load Balancer**, a **Target Group**, 
and a **Listener** for HTTP traffic, with configurations for health checks and routing.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "web_lb" {
  source = "./path/to/this/module"

  name                    = "web-load-balancer"
  load_balancer_type      = "application"  # Or "network" for NLB
  security_groups         = ["sg-xxxxxxxx"]
  subnets                 = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

  target_group_name       = "web-target-group"
  tg_vpc_id               = "vpc-xxxxxxxx"
  tg_port                 = 80
  tg_protocol             = "HTTP"
  tg_deregistration_delay = 300

  health_check_path       = "/health"
  health_check_protocol  = "HTTP"
  health_check_matcher   = "200"
  health_check_interval  = 30
  health_check_timeout   = 5
  healthy_threshold      = 3
  unhealthy_threshold    = 3

  listener_port           = 80
  listener_protocol       = "HTTP"
  default_action_type     = "forward"
  default_action_target_group_arn = "arn:aws:elasticloadbalancing:region:account-id:targetgroup/web-target-group/xxxxxxxx"
}

