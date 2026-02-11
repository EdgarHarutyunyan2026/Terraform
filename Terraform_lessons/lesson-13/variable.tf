variable "region" {
  default = "us-west-2"
}

variable "allow_ports" {
  type    = list(any)
  default = ["80"]
}

variable "security_group_name" {
  default = "My_group_name"
}

variable "common_tags" {
  description = "Common Tag to apply to all resources"
  type        = map(any)
  default = {
    Owner = "Edgar"
    Name  = "default"
  }
}
