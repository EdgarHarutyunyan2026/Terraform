# Terraform Module: AWS Security Group

This Terraform module creates an AWS Security Group (SG) with customizable ingress and egress rules.
It allows defining specific allowed ports, CIDR blocks, and VPC associations for the Security Group.

## Description

This module creates a Security Group in AWS
  with the ability to dynamically configure 
  multiple ingress rules based on the provided ports. 
It also allows setting up egress rules that allow outbound traffic to any destination.

## Usage Example

Example of using the module in a Terraform project:

```hcl
module "web_sg" {
  source = "github.com/EdgarHarutyunyan2025/Terraform_modules//modules/sg"

  sg_count              = 1
  main_vpc_id           = module.vpc.main_vpc_id
  allow_ports           = [80, 443, 8080]                   # Ports to allow for ingress
  sg_cidr_block         = ["0.0.0.0/0"]                     # CIDR block for security group ingress
  main_vpc_cidr_block   = module.vpc.main_vpc_cidr_block    # Main VPC CIDR block
  sg_name               = "web-server"
}

