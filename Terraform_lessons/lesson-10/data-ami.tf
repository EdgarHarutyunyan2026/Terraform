provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
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

output "latest_ubuntu_ami_id" {
  value = data.aws_ami.latest_ubuntu.id
}

output "ubuntu_ami_name" {
  value = data.aws_ami.latest_ubuntu.name
}


output "Amazon_linux_lates_id" {
  value = data.aws_ami.amazon_linux_latest.id
}
