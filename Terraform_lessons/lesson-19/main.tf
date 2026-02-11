provider "aws" {
  region = "ca-central-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "USA"
}

provider "aws" {
  region = "eu-central-1"
  alias  = "GER"
}

#=========================================

data "aws_ami" "amazon_linux_latest" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}

data "aws_ami" "amazon_linux_latest_USA" {
  provider    = aws.USA
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}


data "aws_ami" "amazon_linux_latest_GER" {
  provider    = aws.GER
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
}


#-----------------------------------------

resource "aws_instance" "my_default_server" {
  ami           = data.aws_ami.amazon_linux_latest.id
  instance_type = "t2.micro"
  tags = {
    Name = "default Server"
  }
}

resource "aws_instance" "my_USA_server" {
  provider      = aws.USA
  ami           = data.aws_ami.amazon_linux_latest_USA.id
  instance_type = "t2.micro"
  tags = {
    Name = "USA Server"
  }
}

resource "aws_instance" "my_GER_Server" {
  provider      = aws.GER
  ami           = data.aws_ami.amazon_linux_latest_GER.id
  instance_type = "t2.micro"
  tags = {
    Name = "Gerrmany Server"
  }




}
