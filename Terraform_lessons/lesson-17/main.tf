#---------------------------------------------------
# My Terraform
#
# Terraform Conditions and Lookups
#
#---------------------------------------------------


provider "aws" {
  region = "eu-central-1"
}

variable "env" {
  default = "dev"
}

variable "prod_owner" {
  default = "Edgar"
}

variable "noprod_owner" {
  default = "Petya"
}


variable "ec2_size" {
  type = map(string)
  default = {
    "prod"    = "t3.micro"
    "dev"     = "t2.micro"
    "staging" = "t2small"
  }
}


resource "aws_instance" "prod" {
  count         = (var.env == "prod" ? 1 : 0)
  ami           = "amazon"
  instance_type = (var.env == "prod" ? var.ec2_size["prod"] : "t2.micro")

  tags = {
    Name  = "${var.env}-Server"
    Owner = (var.env == "prod" ? var.prod_owner : var.noprod_owner)
  }
}


resource "aws_instance" "stagig" {
  count         = (var.env == "staging" ? 1 : 0)
  ami           = "amazon"
  instance_type = lookup(var.ec2_size, var.env)

  tags = {
    Name  = "${var.env} Project"
    Owner = "Edgar"
  }
}


resource "aws_instance" "dev" {
  count         = (var.env == "dev" ? 1 : 0)
  ami           = "amazon"
  instance_type = lookup(var.ec2_size, var.env)

  tags = {
    Name  = "${var.env} Project"
    Owner = "Edgar"
  }
}
