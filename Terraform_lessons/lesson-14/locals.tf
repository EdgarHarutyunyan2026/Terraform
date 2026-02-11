data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current-identity" {}
data "aws_region" "current-region" {}
data "aws_vpcs" "my_vpcs" {}

data "aws_vpc" "prod_vpc" {}

locals {
  vpc_id            = data.aws_vpc.prod_vpc.id
  vpc_cider         = data.aws_vpc.prod_vpc.cidr_block
  az_list           = data.aws_availability_zones.working.names
  caller_identity11 = data.aws_caller_identity.current-identity.account_id
  aws_region        = data.aws_region.current-region.name
  my_vpcs           = data.aws_vpcs.my_vpcs.ids

}

output "prod_vpc_id" {
  value = local.vpc_id
}

output "prod_vpc_cider" {
  value = local.vpc_cider
}

output "data_aws_availability_zones" {
  value = "IN ${local.aws_region} Ther ar AZ :   ${join(", ", local.az_list)}"
}

output "data_aws_caller_identity" {
  value = local.caller_identity11
}

output "data_aws_region" {
  value = local.aws_region
}

output "aws_vpcs" {
  value = local.my_vpcs
}

