include {
  path = find_in_parent_folders("common.hcl")
}

dependency "app_vpc" {
  config_path = "../vpcs/app/"
  mock_outputs = {
    private_route_table_ids = ["this", "that"]
    tgw_subnet_ids          = ["eeny", "meeny"]
    vpc_id                  = "yolo"
  }
}
dependency "egress_vpc" {
  config_path = "../vpcs/egress/"
  mock_outputs = {
    private_route_table_ids = ["yoo", "hoo"]
    public_route_table_ids  = ["nay", "yay"]
    tgw_route_table_ids     = ["either", "or"]
    tgw_subnet_ids          = ["teeny", "weeny"]
    vpc_id                  = "lol"
  }
}
dependency "nat_gw" {
  config_path = "../nat-gw/"
  mock_outputs = {
    ids = ["dee", "dumb"]
  }
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
  name                               = "sample-tgw"
  nat_gw_ids                         = dependency.nat_gw.outputs.ids
  ram_enabled                        = local.ram_enabled
  ram_principals                     = local.ram_principals
}

locals {
  ram_enabled    = false
  ram_principals = []
}
