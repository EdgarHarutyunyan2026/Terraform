# AWS SNS Topic and Subscription Terraform Module

This Terraform module creates an **AWS SNS Topic** for sending notifications 
and an **SNS Topic Subscription** to an endpoint (e.g., email, HTTP, etc.).

## Prerequisites

- Terraform >= 0.13
- AWS provider properly configured

## Usage

```hcl
module "cpu_alerts" {
  source = "./path/to/this/module"

  name        = "cpu-alerts-topic"
  topic_arn   = "arn:aws:sns:region:account-id:cpu-alerts-topic"
  protocol    = "email"  # Protocol to use for the subscription (e.g., "email", "http")
  endpoint    = "example@example.com"  # Endpoint to receive notifications (e.g., email address)
}

