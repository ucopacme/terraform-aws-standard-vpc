resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "this" {
  count                                           = var.enabled ? 1 : 0
  tags                                            = merge(var.tags, map("Name", var.name))
  transit_gateway_attachment_id                   = var.transit_gateway_attachment_id
  transit_gateway_default_route_table_association = var.transit_gateway_default_route_table_association
  transit_gateway_default_route_table_propagation = var.transit_gateway_default_route_table_propagation

}
