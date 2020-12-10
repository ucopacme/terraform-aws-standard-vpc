inputs = {
  cidr_block                                       = "10.0.0.0/21"
  enabled_igw                                      = false
  enabled_igw_route                                = false
  enabled_route_table                              = false
  enabled_data_subnets                             = false
  enabled_public_subnets                           = false
  enabled_route_table_main_route_table_association = false
  log_destination                                  = "arn:aws:s3:::logging-dev-chs-bucket"
  name = join("-", [local.application, local.environment, "vpc"
  ])
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:environment" = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }
}

locals {
  application = "wheres-my-super-suit"
  createdBy   = "edna.mode@incredibl.es"
  environment = "prod"
  group       = "incredibles"
  source      = "https://github.com/ucopacme/terraform-aws-vpn.git"
}

terraform {
  source = "./../.."
}
