#--------------------------------------------------------
# My Terraform
#
# Variables
#
# -------------------------------------------------------



provider "aws" {
  region = var.region
}



data "aws_ami" "amazon_linux_latest" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

resource "aws_security_group" "variable_test" {
  name = "Vareble test Security Groupe"
  tags = {
    Name    = "Variable_SG"
    Owner   = "Edgar"
    Project = "DevOps"
  }

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
