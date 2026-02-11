provider "aws" {
  region = var.region
}

resource "aws_security_group" "web" {
  name = var.security_group_name
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
  #  tags = var.common_tags
  tags = merge(var.common_tags, { Name = "Server IP" })
}

resource "aws_instance" "Web" {
  ami             = "amazon"
  instance_type   = "t2.micro"
  security_groups = aws_security_group.web
}
