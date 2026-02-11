variable "name" {
  default = "gren-blue-LT"
}

variable "image_id" {
  default = ""
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_security_group_ids" {
  default = []
}

variable "ssh_key_name" {
  default = ""
}

variable "user_data" {
  default = ""
}

variable "my_tags" {
  type = map(string)
  default = {
    Name = "Edgar"
  }
}

