/**
 * # terraform aws vpn module
 *
 * this module creates AWS vpn
 * * [vpn gateway](https://www.terraform.io/docs/providers/aws/r/vpn_gateway.html)
 * * [customer gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)
 * * [vpn connection](https://www.terraform.io/docs/providers/aws/r/vpn_connection.html)
 * * [optional vpn gateay route propagation](https://www.terraform.io/docs/providers/aws/r/vpn_gateway_route_propagation.html)
 * * [optional vpn connection route](https://www.terraform.io/docs/providers/aws/r/vpn_connection_route.html)
 *
 * proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending
 *
 */

# https://www.terraform.io/docs/providers/aws/r/customer_gateway.html
resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_gateway_bgp_asn
  count      = var.enabled ? 1 : 0
  ip_address = var.customer_gateway_ip_address
  tags       = merge(var.tags, tomap({"Name" = var.name}))
  type       = "ipsec.1"
}

# https://www.terraform.io/docs/providers/aws/r/vpn_connection.html
resource "aws_vpn_connection" "this" {
  count                 = var.enabled ? 1 : 0
  customer_gateway_id   = join("", aws_customer_gateway.this.*.id)
  static_routes_only    = var.vpn_connection_static_routes_only
  tags                  = merge(var.tags, tomap({"Name" = var.name}))
  transit_gateway_id    = var.transit_gateway_id
  tunnel1_inside_cidr   = var.vpn_connection_tunnel1_inside_cidr
  tunnel1_preshared_key = var.vpn_connection_tunnel1_preshared_key
  tunnel2_inside_cidr   = var.vpn_connection_tunnel2_inside_cidr
  tunnel2_preshared_key = var.vpn_connection_tunnel2_preshared_key
  type                  = aws_customer_gateway.this[0].type
}
