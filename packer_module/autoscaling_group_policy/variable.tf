variable "autoscaling_policy_name" {
  default = "scale-up-policy"
}

variable "scaling_adjustment" {
  default = 1
}

variable "adjustment_type" {
  default = "ChangeInCapacity"
}

variable "cooldown" {
  default = 60
}

variable "policy_autoscaling_group_name" {
  default = ""
}
