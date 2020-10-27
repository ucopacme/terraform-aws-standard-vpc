locals {
  enabled = var.enabled == "true"
}
resource "aws_ec2_transit_gateway_route" "this" {
  count                          = local.enabled ? 1 : 0
  destination_cidr_block         = var.destination_cidr_block
  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
