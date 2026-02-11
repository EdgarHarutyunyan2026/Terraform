output "instance_id" {
  value = aws_instance.my-web-server1.id
}

output "instance_public_ip" {
  value = aws_instance.my-web-server1.public_ip
}

output "aws_sg_id" {
  value = aws_security_group.my-webserver.id
}


output "aws_sg_arn" {
  value = aws_security_group.my-webserver.arn
}
