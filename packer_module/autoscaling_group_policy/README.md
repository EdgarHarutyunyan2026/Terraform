# AWS Auto Scaling Policy (Scale Up) Terraform Module

This Terraform module defines an **AWS Auto Scaling Policy** 
that increases the number of EC2 instances in an existing 
Auto Scaling Group based on scaling rules.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "scale_up_policy" {
  source = "./path/to/this/module"

  autoscaling_policy_name        = "scale-up-policy"
  scaling_adjustment             = 1
  adjustment_type                = "ChangeInCapacity"
  cooldown                       = 300
  policy_autoscaling_group_name = "example-asg"
}

