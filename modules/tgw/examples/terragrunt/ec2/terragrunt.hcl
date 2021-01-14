dependency "app-vpc" {
  config_path = "../vpcs/app/"
}

inputs = {
  createdBy             = local.createdBy
  enabled               = true
  enabled_public_ec2    = false
  name                  = local.name
  app_public_subnet_id  = dependency.app-vpc.outputs.public_subnet_ids[0]
  app_private_subnet_id = dependency.app-vpc.outputs.private_subnet_ids[0]
  app_vpc_id            = dependency.app-vpc.outputs.vpc_id
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
  name        = "app"
  source      = "git@github.com:ucopacme/terraform-aws-standard-vpc.git"
}
