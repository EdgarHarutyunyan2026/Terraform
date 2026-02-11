provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-test-project-network"
    key    = "dev/servers/terraform.tfstate"
    region = "us-east-1"
  }
}

#==================================================

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-test-project-network"
    key    = "dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "amazon_linux_latest" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

#==================================================

resource "aws_instance" "web-server" {
  ami                    = data.aws_ami.amazon_linux_latest.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver.id]
  subnet_id              = data.terraform_remote_state.network.outputs.public_subnet_ids[0]
}


resource "aws_security_group" "webserver" {
  name   = "WebServer Security Group"
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.network.outputs.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web-Server-SG"
    Owner = "Edgar"
  }
}

#==================================================


output "network_details" {
  value = data.terraform_remote_state.network
}



output "webserver_sg_id" {
  value = aws_security_group.webserver.id
}
