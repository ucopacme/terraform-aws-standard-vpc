locals {
  enabled = var.enabled == "true"
}
resource "aws_route" "this" {
  count = local.enabled ? 1 : 0
  # Not taggable

  destination_cidr_block = var.destination_cidr_block
  route_table_id         = var.route_table_id

  egress_only_gateway_id    = var.egress_only_gateway_id
  gateway_id                = var.gateway_id
  instance_id               = var.instance_id
  nat_gateway_id            = var.nat_gateway_id
  network_interface_id      = var.network_interface_id
  transit_gateway_id        = var.transit_gateway_id
  vpc_peering_connection_id = var.vpc_peering_connection_id
}
