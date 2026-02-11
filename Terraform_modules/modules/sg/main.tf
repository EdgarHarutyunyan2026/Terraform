resource "aws_security_group" "web-sg" {
  count  = var.sg_count
  vpc_id = var.main_vpc_id != "" ? var.main_vpc_id : null

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.sg_cidr_block
    }
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = length(var.main_vpc_cidr_block) > 0 ? var.main_vpc_cidr_block : var.sg_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.sg_name}-SG-${count.index + 1}"
    Owner = "Edgar"
  }
}
