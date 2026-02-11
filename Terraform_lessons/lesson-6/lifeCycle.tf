provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "lifecycle-test" {
  ami                    = "ami-06ee6255945a96aba"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http_ssh.id]
  user_data = templatefile("user_data.sh.tpl", {
    f_name = "Edgar"
    l_name = "Harutyunyan"
    name   = ["Vasya", "Kolya", "Petya", "Masha"]
  })

  tags = {
    Name  = "Lifecycle test web server"
    Owner = "Egdar"
  }

  lifecycle {
    ignore_changes = [ami, user_data]
  }


}
resource "aws_security_group" "http_ssh" {
  name        = "webservr security group"
  description = "my first security"

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
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}


