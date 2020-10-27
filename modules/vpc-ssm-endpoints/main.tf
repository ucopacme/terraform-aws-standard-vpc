locals {
  enabled = var.enabled == "true"
}

# https://www.terraform.io/docs/providers/aws/r/customer_gateway.html
resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_gateway_bgp_asn
  count      = local.enabled ? 1 : 0
  ip_address = var.customer_gateway_ip_address
  tags       = merge(var.tags, map("Name", var.name))
  type       = "ipsec.1"
}

# https://www.terraform.io/docs/providers/aws/r/vpn_connection.html
resource "aws_vpn_connection" "this" {
  count                 = local.enabled ? 1 : 0
  customer_gateway_id   = join("", aws_customer_gateway.this.*.id)
  static_routes_only    = var.vpn_connection_static_routes_only
  tags                  = merge(var.tags, map("Name", var.name))
  transit_gateway_id    = var.transit_gateway_id
  tunnel1_inside_cidr   = var.vpn_connection_tunnel1_inside_cidr
  tunnel1_preshared_key = var.vpn_connection_tunnel1_preshared_key
  tunnel2_inside_cidr   = var.vpn_connection_tunnel2_inside_cidr
  tunnel2_preshared_key = var.vpn_connection_tunnel2_preshared_key
  type                  = aws_customer_gateway.this[0].type
}
