variable "region" {
  description = "Please Enter AWS Region to deploy"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "allow_ports" {
  description = "List of ports to open for server"
  type        = list(any)
  default     = ["80", "22", "33", "443"]
}
