inputs = {
  cidr_block = "10.0.0.0/21"
  #log_destination = "arn:aws:s3:::logging-dev-bucket"
  #log_destination = "arn:aws:s3:::logging-dev-chs-bucket/UCOP/"
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
