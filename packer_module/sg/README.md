# AWS Security Group Terraform Module

This Terraform module creates an **AWS Security Group** with customizable ingress rules 
and a default egress rule allowing all outbound traffic.

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "web_sg" {
  source = "./path/to/this/module"

  allow_ports  = [80, 443]  # List of ports to allow in ingress rules
  protocol     = "tcp"      # Protocol for ingress and egress (e.g., "tcp", "udp")
  cidr_blocks  = ["0.0.0.0/0"]  # CIDR blocks for ingress rules
}

