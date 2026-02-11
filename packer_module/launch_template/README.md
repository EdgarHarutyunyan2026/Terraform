# AWS Launch Template Terraform Module

This Terraform module creates an **AWS Launch Template** for EC2 instances,
 which can be used to launch instances within an Auto Scaling Group or as standalone instances.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "web_lt" {
  source = "./path/to/this/module"

  name                    = "web-instance-template"
  image_id                = "ami-xxxxxxxxxxxxxxxxx"
  instance_type           = "t2.micro"
  ssh_key_name            = "my-ssh-key"
  vpc_security_group_ids  = ["sg-xxxxxxxx"]
  user_data               = "path/to/user_data.sh"
  my_tags                 = {
    Name    = "WebInstance"
    Project = "DevOps"
  }
}

