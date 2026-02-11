variable "region" {
  default = "eu-central-1"
}

variable "sg_name" {
  default = "default_sg"
}

variable "sg_count" {
  default = 1
}

variable "allow_ports" {
  type    = list(any)
  default = ["80", "443"]
}

variable "main_vpc_id" {
  type    = string
  default = ""
}

variable "main_vpc_cidr_block" {
  type    = list(string)
  default = []
}

variable "sg_cidr_block" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

