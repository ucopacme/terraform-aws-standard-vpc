# create a transit gateway (tgw)
module "tgw" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  description                     = "transit gateway for testing"
  name                            = "testing"
  ram_enabled                     = "false"
  ram_principals                  = []
  source                          = "./../../../../"
  tags                            = merge(var.tags, map("Name", "testing"))
}

# attach app vpc to tgw
module "app_tgw_attachment" {
  enabled            = true
  name               = "app-tgw-attachment"
  source             = "./../../../../../tgw_attachment/"
  subnet_ids         = var.app_tgw_subnet_ids
  transit_gateway_id = module.tgw.tgw_id
  vpc_id             = var.app_vpc_id
}


# create default private route to tgw
resource "aws_route" "app_vpc_private_subnet_route_to_tgw" {
  # Not taggable
  count                  = var.enabled ? length(var.app_vpc_private_route_table_ids) : 0
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = var.app_vpc_private_route_table_ids[count.index]
  transit_gateway_id     = module.tgw.tgw_id
}

#resource "aws_ec2_transit_gateway_route" "app" {
#  count                          = length(var.app_tgw_route_cidr_attachment_id_list)
#  destination_cidr_block         = "0.0.0.0/0"
#  transit_gateway_attachment_id  = module.egress_tgw_attachment.id
#  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.app[0].id
#}

# attach egress vpc to tgw
module "egress_tgw_attachment" {
  enabled            = true
  name               = "egress-tgw-attachment"
  source             = "./../../../../../tgw_attachment/"
  subnet_ids         = var.egress_tgw_subnet_ids
  transit_gateway_id = module.tgw.tgw_id
  vpc_id             = var.egress_vpc_id
}

# create egress tgw route table
module "egress_tgw_route_table" {
  enabled            = true
  name               = "egress-tgw-route-table"
  source             = "./../../../../../tgw_route_table/"
  transit_gateway_id = module.tgw.tgw_id
  tags               = merge(var.tags, map("Name", join("-", [var.name, "egress"])))
}

# propagate egress vpc route to egresss tgw route table
module "egress_vpc_propagation_egress_tgw_route_table" {
  enabled                        = true
  name                           = "egress_vpc_propagation_egress_tgw_route_table"
  source                         = "./../../../../../tgw_route_table_propagation/"
  transit_gateway_attachment_ids = [module.egress_tgw_attachment.id, module.app_tgw_attachment.id]
  transit_gateway_route_table_id = module.egress_tgw_route_table.id
}

# Associate egress tgw vpc attachment with egress tgw route table
resource "aws_ec2_transit_gateway_route_table_association" "egress" {
  count                          = 1
  transit_gateway_attachment_id  = module.egress_tgw_attachment.id
  transit_gateway_route_table_id = module.egress_tgw_route_table.id
}
# Associate app tgw vpc attachment with egress tgw route table
resource "aws_ec2_transit_gateway_route_table_association" "app" {
  count                          = 1
  transit_gateway_attachment_id  = module.app_tgw_attachment.id
  transit_gateway_route_table_id = module.egress_tgw_route_table.id
}

# route public subnet in egress vpc to transit gateway
resource "aws_route" "egress_vpc_public_subnet_route_to_tgw" {
  # Not taggable
  count                  = var.enabled ? length(var.egress_vpc_public_route_table_ids) : 0
  destination_cidr_block = "10.0.0.0/8"
  route_table_id         = var.egress_vpc_public_route_table_ids[count.index]
  transit_gateway_id     = module.tgw.tgw_id
}

# default route for tgw subnets in egress vpc to respective public nat gateways in egress vpc
resource "aws_route" "egress_vpc_tgw_subnet_route_to_ngw" {
  # Not taggable
  count                  = var.enabled ? length(var.egress_vpc_tgw_route_table_ids) : 0
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw_ids[count.index]
  route_table_id         = var.egress_vpc_tgw_route_table_ids[count.index]
}

resource "aws_ec2_transit_gateway_route" "egress" {
  count                          = var.enabled ? 1 : 0
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = module.egress_tgw_attachment.id
  transit_gateway_route_table_id = module.egress_tgw_route_table.id
}
