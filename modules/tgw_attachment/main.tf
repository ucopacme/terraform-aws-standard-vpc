resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  count                                           = var.enabled ? 1 : 0
  subnet_ids                                      = var.subnet_ids
  tags                                            = merge(var.tags, map("Name", var.name))
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation
  transit_gateway_id                              = var.transit_gateway_id
  vpc_id                                          = var.vpc_id

}
