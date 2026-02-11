provider "aws" {
  region = "eu-central-1"
}


variable "aws_users" {
  description = "List of IMA Users to creat"
  default     = ["vasya", "petya", "kolya"]
}

resource "aws_iam_user" "user1" {
  name = "pushkin"
}

resource "aws_iam_user" "users" {
  count = length(var.aws_users)
  name  = element(var.aws_users, count.index)
}


output "created_iam_users_all" {
  value = aws_iam_user.users
}

output "created_iam_users_ids" {
  value = aws_iam_user.users[*].id
}

output "created_iam_users_custom" {
  value = [
    for user in aws_iam_user.users :
    "UserName: ${user.name} has ARN: ${user.arn}"
  ]
}

output "created_iam_users_map" {
  value = {
    for user in aws_iam_user.users :
    user.unique_id => user.id
  }
}


output "custom_if_length" {
  value = [
    for x in aws_iam_user.users :
    x.name
    if length(x.name) == 5
  ]
}
