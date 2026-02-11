resource "aws_lb" "web_lb" {
  name               = var.name
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets
}

resource "aws_lb_target_group" "web_tg" {
  name                 = var.target_group_name
  vpc_id               = var.tg_vpc_id
  port                 = var.tg_port
  protocol             = var.tg_protocol
  deregistration_delay = var.tg_deregistration_delay

  health_check {
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    matcher             = var.health_check_matcher
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = var.listener_load_balancer_arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = var.default_action_type
    target_group_arn = var.default_action_target_group_arn
  }
}

