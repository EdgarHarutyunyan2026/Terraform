resource "aws_autoscaling_policy" "scale_up" {
  name                   = var.autoscaling_policy_name
  scaling_adjustment     = var.scaling_adjustment
  adjustment_type        = var.adjustment_type
  cooldown               = var.cooldown
  autoscaling_group_name = var.policy_autoscaling_group_name
}
