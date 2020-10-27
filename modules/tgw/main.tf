locals {
  enabled     = var.enabled == "true"
  ram_enabled = var.ram_enabled == "true"
}

resource "aws_ec2_transit_gateway" "this" {
  amazon_side_asn                 = var.amazon_side_asn
  auto_accept_shared_attachments  = var.auto_accept_shared_attachments
  count                           = local.enabled ? 1 : 0
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  description                     = var.description
  dns_support                     = var.dns_support
  tags                            = merge(var.tags, map("Name", var.name))
  vpn_ecmp_support                = var.vpn_ecmp_support
}

resource "aws_ram_resource_share" "this" {
  count = local.ram_enabled ? 1 : 0
  name  = var.name
  tags  = merge(var.tags, map("Name", var.name))
}

resource "aws_ram_resource_association" "this" {
  count              = local.ram_enabled ? 1 : 0
  resource_arn       = aws_ec2_transit_gateway.this[0].arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_principal_association" "this" {
  count              = local.enabled ? length(var.ram_principals) : 0
  principal          = var.ram_principals[count.index]
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
