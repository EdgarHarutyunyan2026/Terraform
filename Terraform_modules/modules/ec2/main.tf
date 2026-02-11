#------------- Resource ----------------------


resource "aws_instance" "web" {
  count           = var.ec2_count
  ami             = var.ec2_ami != "" ? var.ec2_ami : data.aws_ami.amazon_linux_latest.id
  instance_type   = var.ec2_type
  subnet_id       = var.ec2_subnet_id != "" ? var.ec2_subnet_id : null
  security_groups = var.ec2_security_group_ids

  user_data = var.user_data != "" ? file("${var.user_data}") : null
  tags = {
    Name  = "${var.ec2_name}-${count.index + 1}"
    Owner = "Edgar"
  }
}
