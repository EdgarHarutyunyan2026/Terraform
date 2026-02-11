# AWS Auto Scaling Group (ASG) Terraform Module

This Terraform module creates an AWS Auto Scaling Group (ASG) 
using a Launch Template and associates it with specified Target Groups.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured (via `~/.aws/credentials`, environment variables, or other methods)

## Usage

```hcl
module "asg" {
  source = "./path/to/this/module"

  autoscaling_group_name  = "example-asg"
  min_size                = 1
  max_size                = 3
  desired_capacity        = 2
  min_elb_capacity        = 1
  health_check_type       = "EC2"
  vpc_zone_identifier     = ["subnet-12345678", "subnet-87654321"]
  target_group_arns       = ["arn:aws:elasticloadbalancing:..."]
  launch_template_id      = "lt-0123456789abcdef0"
  launch_template_version = "$Latest"
  versions                = "1.0.0"
}

