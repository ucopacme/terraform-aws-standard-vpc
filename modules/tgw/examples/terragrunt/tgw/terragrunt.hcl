dependency "app_vpc" {
  config_path = "../vpcs/app/"
}
dependency "egress_vpc" {
  config_path = "../vpcs/egress/"
}
dependency "nat_gw" {
  config_path = "../nat-gw/"
}

inputs = {
  app_vpc_private_route_table_ids    = dependency.app_vpc.outputs.private_route_table_ids
  app_tgw_subnet_ids                 = dependency.app_vpc.outputs.tgw_subnet_ids
  app_vpc_id                         = dependency.app_vpc.outputs.vpc_id
  destination_cidr_block             = "0.0.0.0/0"
  egress_vpc_private_route_table_ids = dependency.egress_vpc.outputs.private_route_table_ids
  egress_vpc_public_route_table_ids  = dependency.egress_vpc.outputs.public_route_table_ids
  egress_vpc_tgw_route_table_ids     = dependency.egress_vpc.outputs.tgw_route_table_ids
  egress_tgw_subnet_ids              = dependency.egress_vpc.outputs.tgw_subnet_ids
  egress_vpc_id                      = dependency.egress_vpc.outputs.vpc_id
  enabled                            = true
  name = join("-", [local.application, local.environment, "network-canary"
  ])
  nat_gw_ids     = dependency.nat_gw.outputs.ids
  ram_enabled    = local.ram_enabled
  ram_principals = local.ram_principals
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:environment" = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }
}

locals {
  application    = "standard-tgw-network"
  createdBy      = join(" ", ["terraform:", substr(get_aws_caller_identity_arn(), 0, length(get_aws_caller_identity_arn()) - 20)])
  environment    = "dev"
  group          = "incredibles"
  name           = "central-network"
  ram_enabled    = false
  ram_principals = []
  source         = "git@github.com:ucopacme/terraform-aws-standard-vpc.git"
}
