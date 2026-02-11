provider "aws" {
	region     = "eu-central-1"
}


resource "aws_instance" "my_ubuntu" {
	count         = 0
	ami 	      = "ami-06ee6255945a96aba"
	instance_type = "t2.micro"
}


resource "aws_instance" "my_amazon" {
        ami           = "ami-06ee6255945a96aba"
        instance_type = "t2.micro"

	tags = {
		Name  	= "My Amazon Server" 
		Owner 	= "Edgar"
		Project = "Terraform Lessons"
}
}
