inputs = {
  cidr_block              = "10.100.0.0/21"
  createdBy               = local.createdBy
  enabled                 = true
  enabled_data_subnets    = false
  enabled_public_subnets  = true
  enabled_private_subnets = false
  enabled_tgw_subnets     = true
  enabled_flow_logs       = false
  name                    = local.name
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:environment" = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }
}

locals {
  application = "standard-tgw-network"
  createdBy   = join(" ", ["terraform:", substr(get_aws_caller_identity_arn(), 0, length(get_aws_caller_identity_arn()) - 20)])
  environment = "dev"
  group       = "incredibles"
  name        = "egress"
  source      = "git@github.com:ucopacme/terraform-aws-standard-vpc.git"
}

terraform {
  source = "./../../../../../../"
}
