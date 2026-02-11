# AWS CloudWatch CPU High Alarm - Terraform Module

This Terraform module creates an **AWS CloudWatch Metric Alarm** 
that monitors high CPU usage for an 
Auto Scaling Group and triggers defined actions, such as scaling policies.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "cpu_alarm_high" {
  source = "./path/to/this/module"

  alarm_name                     = "high-cpu-alarm"
  comparison_operator            = "GreaterThanThreshold"
  evaluation_periods             = 2
  metric_name                    = "CPUUtilization"
  namespace                      = "AWS/EC2"
  period                         = 120
  statistic                      = "Average"
  threshold                      = 70
  alarm_description              = "Trigger if CPU usage exceeds 70% for 4 minutes"
  alarm_actions                  = ["arn:aws:autoscaling:region:account-id:scalingPolicy:...:autoScalingGroupName/your-asg:policyName/scale-up"]
  dimensions_AutoScalingGroupName = "your-asg"
}

