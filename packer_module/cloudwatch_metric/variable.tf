variable "alarm_name" {
  default = "CPU-Utilization-Above-80"
}

variable "comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  default = 2
}

variable "metric_name" {
  default = "CPUUtilization"
}

variable "namespace" {
  default = "AWS/EC2"
}

variable "period" {
  default = 60
}

variable "statistic" {
  default = "Average"
}

variable "threshold" {
  default = 80
}

variable "alarm_description" {
  default = "Alarm when CPU exceeds 80%"
}

variable "alarm_actions" {
  default = []
}

variable "dimensions_AutoScalingGroupName" {
  default = ""
}
