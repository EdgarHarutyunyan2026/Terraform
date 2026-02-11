variable "autoscaling_group_name" {
  default = "ASG V-1"
}

variable "versions" {
  default = "1"
}

variable "min_size" {
  default = 1
}

variable "max_size" {
  default = 2
}

variable "desired_capacity" {
  default = 1
}

variable "min_elb_capacity" {
  default = 1
}

variable "health_check_type" {
  default = "ELB"
}

variable "vpc_zone_identifier" {
  default = []
}

variable "target_group_arns" {
  default = []
}

variable "launch_template_id" {
  default = ""
}

variable "launch_template_version" {
  default = ""
}


#variable "autoscaling_policy_name" {
#  default = "scale-up-policy"
#}
#
#variable "scaling_adjustment" {
#  default = 1
#}
#
#variable "adjustment_type" {
#  default = "ChangeInCapacity"
#}
#
#variable "cooldown" {
#  default = 60
#}
#
#variable "policy_autoscaling_group_name" {
#  default = aws_autoscaling_group.web.name
#}
#
