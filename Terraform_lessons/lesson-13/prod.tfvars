region              = "eu-central-1"
allow_ports         = ["22", "443"]
security_group_name = "Prod_Security_Group"

common_tags = {
  Name        = "Prod-SG"
  Owner       = "Edgar Harutyunyan"
  Project     = "DevOps"
  Environment = "Prod"
}
