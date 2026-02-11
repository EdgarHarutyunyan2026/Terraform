variable "name" {
  default = "cpu-alerts-topic"
}

variable "topic_arn" {
  default = "aws_sns_topic.cpu_alerts.arn"
}

variable "protocol" {
  default = "email"
}

variable "endpoint" {
  default = "edgar_harutyunyan_2025@bk.ru"
}
