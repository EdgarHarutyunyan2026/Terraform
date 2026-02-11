# Terraform Module: EC2 Instances

This Terraform module creates EC2 instances in AWS.
It allows flexible configuration of the number of instances,
AMI type, instance type, subnet, security groups, and the `user_data` script for instance initialization.

## Description

This module creates EC2 instances in AWS using the parameters provided in the variables.
It supports creating multiple instances with the `count` variable and allows specifying custom parameters for AMI,
instance type, subnet, and security groups.

## Usage Example

Example of using the module in a Terraform project:

```hcl
module "ec2_instances" {
  source = "github.com/EdgarHarutyunyan2025/Terraform_modules//modules/ec2"

  ec2_count        = 2
  ec2_ami          = "ami-0abcdef1234567890"
  ec2_type         = "t2.micro"
  ec2_subnet_id    = module.vpc.public_subnet_ids[0]
  ec2_security_group_ids = ["sg-0abc1234", "sg-0def5678"]
  user_data        = "scripts/init.sh"
  ec2_name         = "web-server"
}

