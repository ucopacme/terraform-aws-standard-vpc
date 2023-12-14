# VPC endpoint
resource "aws_vpc_endpoint" "this" {
  count = var.enabled ? length(var.availability_zones) : 0
  tags  = merge(var.tags, tomap({"Name" = var.name}))

  private_dns_enabled = var.private_dns_enabled
  security_group_ids  = var.security_group_ids
  subnet_ids          = var.subnet_ids
  service_name        = var.service_name
  vpc_endpoint_type   = var.vpc_endpoint_type
  vpc_id              = var.vpc_id
}
