output "launch_template_id" {
  value = aws_launch_template.web_lt.id
}

output "launch_template_version" {
  value = aws_launch_template.web_lt.latest_version
}
