inputs = {
  enabled = true
  name    = join("-", [local.application, local.environment, "tgw-rtb-propagation"])
  tags = {
    "ucop:application" = local.application
    "ucop:createdBy"   = local.createdBy
    "ucop:environment" = local.environment
    "ucop:group"       = local.group
    "ucop:source"      = local.source
  }
  transit_gateway_attachment_ids = ["this", "that", "other"]
  transit_gateway_route_table_id = "tgw-rtb-0123456abcde"
}

locals {
  application = "super-duper"
  createdBy   = "edna.mode@incredibl.es"
  environment = "prod"
  group       = "incredibles"
  source      = "https://github.com/ucopacme/terraform-modules.git"
}

terraform {
  source = "./.."
}
