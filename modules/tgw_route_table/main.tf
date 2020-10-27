locals {
  enabled = var.enabled == "true"
}
resource "aws_ec2_transit_gateway_route_table" "this" {
  count              = local.enabled ? 1 : 0
  transit_gateway_id = var.transit_gateway_id
  tags               = merge(var.tags, map("Name", var.name))
}
