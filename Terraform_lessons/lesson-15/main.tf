provider "aws" {
  region = "eu-central-1"
}

data "aws_ami" "amazon_linux_latest" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}


resource "null_resource" "command1" {
  provisioner "local-exec" {
    command = "echo Terraform START : $(date) >> log.txt"
  }
}

resource "null_resource" "command2" {
  provisioner "local-exec" {
    command     = "print('Hello World!')"
    interpreter = ["python3", "-c"]
  }
}


resource "null_resource" "command3" {
  provisioner "local-exec" {
    command = "echo $NAME1 $NAME2 $NAME3 >> names.txt"
    environment = {
      NAME1 = "VASYA"
      NAME2 = "KOLYA"
      NAME3 = "PETYA"
    }
  }
}

resource "aws_instance" "myserver" {
  ami           = data.aws_ami.amazon_linux_latest.id
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "rm text.txt"
  }
}
