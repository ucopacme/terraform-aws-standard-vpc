#
dependency "vpc" {
  config_path = "../vpcs/egress"
}

inputs = {
  application = local.application
  createdBy   = local.createdBy
  enabled     = true
  environment = local.environment
  group       = local.group
  name        = join("-", [local.application, local.environment, "nat-gw"])
  source      = local.source
  subnet_ids  = dependency.vpc.outputs.public_subnet_ids
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
  name        = "central-network"
  source      = "git@github.com:ucopacme/terraform-aws-standard-vpc.git"
}
