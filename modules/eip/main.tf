resource "aws_eip" "this" {
  count = var.enabled ? 1 : 0
  vpc   = true
  tags  = merge(var.tags, tomap({"Name" = var.name}))
}
