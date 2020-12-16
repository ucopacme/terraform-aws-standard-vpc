resource "aws_route_table" "this" {
  count = var.enabled ? 1 : 0
  tags  = merge(var.tags, map("Name", var.name))

  vpc_id = var.vpc_id
}
