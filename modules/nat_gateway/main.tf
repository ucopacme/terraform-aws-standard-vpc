resource "aws_nat_gateway" "this" {
  allocation_id = var.allocation_id
  count         = var.enabled ? 1 : 0
  subnet_id     = var.subnet_id
  tags          = merge(var.tags, tomap({"Name" = var.name}))
}

