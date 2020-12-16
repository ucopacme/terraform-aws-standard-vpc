inputs = {
  ami                         = ""
  associate_public_ip_address = true
  cidr_block                  = "10.0.0.0/21"
  enabled                     = true
  name = join("-", [local.application, local.environment, "network-canary"
  ])
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
