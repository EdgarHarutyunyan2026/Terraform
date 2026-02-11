variable "allow_ports" {
  default = ["80", "22"]
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "protocol" {
  default = "tcp"
}
