resource "aws_ec2_transit_gateway_route_table_association" "this" {
  count = var.enabled ? 1 : 0
  # not taggable
  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
