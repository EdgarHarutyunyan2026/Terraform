region              = "eu-central-1"
allow_ports         = ["80", "22", "443", "55"]
security_group_name = "Dev_Security_Group"

common_tags = {
  Name        = "Dev-SG"
  Owner       = "Edgar Harutyunyan"
  Project     = "DevOps"
  Environment = "Dev"
}
