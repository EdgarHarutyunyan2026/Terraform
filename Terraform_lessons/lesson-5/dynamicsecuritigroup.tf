provider "aws" {
	region = "eu-central-1"
}

resource "aws_security_group" "dynamic_group" {
	name	    = "test security group"
	description = "test dynamic group"

	dynamic "ingress" {
		for_each = ["80","8080","50","60"]
		content {
			from_port   = ingress.value
			to_port     = ingress.value
			protocol    = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
			}

		}

	ingress {
		from_port   = "22"
		to_port     = "22"
		protocol    = "tcp"
		cidr_blocks = ["10.10.10.0/24"]

	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

}
