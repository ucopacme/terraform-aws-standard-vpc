resource "aws_internet_gateway" "this" {
  count  = var.enabled ? 1 : 0
  tags   = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id = var.vpc_id
}

