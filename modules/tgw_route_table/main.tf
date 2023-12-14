resource "aws_ec2_transit_gateway_route_table" "this" {
  count              = var.enabled ? 1 : 0
  transit_gateway_id = var.transit_gateway_id
  tags               = merge(var.tags, tomap({"Name" = var.name}))
}
