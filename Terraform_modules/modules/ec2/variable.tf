variable "region" {
  default = "eu-central-1"
}

variable "ec2_name" {
  default = "Dev"
}

variable "ec2_count" {
  default = 1
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_ami" {
  type    = string
  default = ""
}

variable "ec2_subnet_id" {
  type    = string
  default = ""
}

variable "ec2_security_group_ids" {
  type    = list(any)
  default = []
}

variable "user_data" {
  type    = string
  default = ""
}
