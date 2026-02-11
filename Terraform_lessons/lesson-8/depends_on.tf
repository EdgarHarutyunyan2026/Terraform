provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "web" {
  count                  = 0
  ami                    = "ami-06ee6255945a96aba"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "my web server"
  }
  depends_on = [aws_instance.my_app]
}

resource "aws_instance" "my_app" {
  count                  = 0
  ami                    = "ami-06ee6255945a96aba"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  depends_on             = [aws_instance.my_db]
}

resource "aws_instance" "my_db" {
  count                  = 0
  ami                    = "ami-06ee6255945a96aba"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]
}


resource "aws_security_group" "web_sg" {
  dynamic "ingress" {
    for_each = ["80", "22"]
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
