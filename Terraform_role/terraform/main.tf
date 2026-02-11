provider "aws" {
  region = var.region
}

resource "aws_launch_template" "web_lt" {
  name                   = "gren-blue-LT"
  image_id               = data.aws_ami.amazon_linux_latest.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  user_data              = filebase64("../web/user_data.sh")
}

resource "aws_autoscaling_group" "web" {
  name                = "gren-blue-ASG V-${aws_launch_template.web_lt.latest_version}"
  min_size            = 2
  max_size            = 2
  min_elb_capacity    = 2
  health_check_type   = "ELB"
  vpc_zone_identifier = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
  target_group_arns   = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = aws_launch_template.web_lt.latest_version
  }

  dynamic "tag" {
    for_each = {
      Name    = "WebServer in ASG v - ${aws_launch_template.web_lt.latest_version}"
      Project = "DevOps"
    }

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_lb" "web_lb" {
  name               = "green-blue-ALB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]
}

resource "aws_lb_target_group" "web_tg" {
  name                 = "green-blue-tg"
  vpc_id               = aws_default_vpc.default.id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 10
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

output "web_loadbalancer_url" {
  value = aws_lb.web_lb.dns_name
}
