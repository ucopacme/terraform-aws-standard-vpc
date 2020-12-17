module "tgw" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  description                     = "transit gateway for testing"
  name                            = "testing"
  ram_enabled                     = "false"
  ram_principals                  = []
  source                          = "./../../../"
  tags                            = merge(var.tags, map("Name", "testing"))
}

module "app_tgw_attachment" {
  enabled            = true
  name               = "app-tgw-attachment"
  source             = "./../../../../tgw_attachment/"
  subnet_ids         = var.app_tgw_subnet_ids
  transit_gateway_id = module.tgw.tgw_id
  vpc_id             = var.app_vpc_id
}

module "app_tgw_route_table" {
  enabled            = true
  name               = "app-tgw-route-table"
  source             = "./../../../../tgw_route_table/"
  transit_gateway_id = module.tgw.tgw_id
  tags               = merge(var.tags, map("Name", join("-", [var.name, "app"])))
}

module "app_vpc_private_subnet_route_to_tgw" {
  destination_cidr_block = var.destination_cidr_block
  enabled                = true
  source                 = "./../../../../route/"
  route_table_id         = var.app_vpc_private_route_table_id
  transit_gateway_id     = module.tgw.tgw_id
}

resource "aws_ec2_transit_gateway_route_table_association" "app" {
  count                          = 1
  transit_gateway_attachment_id  = module.app_tgw_attachment.id
  transit_gateway_route_table_id = module.app_tgw_route_table.id
}

#resource "aws_ec2_transit_gateway_route" "app" {
#  count                          = length(var.app_tgw_route_cidr_attachment_id_list)
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = module.egress_tgw_attachment.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.app[0].id
#}
#
#resource "aws_ec2_transit_gateway_route_table" "egress" {
#  count              = 1
#  transit_gateway_id = module.transit_gateway_id
#  tags               = merge(var.tags, map("Name", join("-", [var.name, "egress"])))
#}
#
#resource "aws_ec2_transit_gateway_route_table_association" "egress" {
#  count = length(var.egress_tgw_rtb_associations_attachment_ids)
#  # not taggable
#  transit_gateway_attachment_id  = var.egress_tgw_rtb_associations_attachment_ids[count.index]
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress[0].id
#}
#
#resource "aws_ec2_transit_gateway_route" "egress" {
#  count                          = length(var.egress_tgw_route_cidr_attachment_id_list)
#  destination_cidr_block         = var.egress_tgw_route_cidr_attachment_id_list[count.index].cidr
#  transit_gateway_attachment_id  = var.egress_tgw_route_cidr_attachment_id_list[count.index].attachment_id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress[0].id
#}
