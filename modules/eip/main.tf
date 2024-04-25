resource "aws_eip" "this" {
  count  = var.enabled ? 1 : 0
  domain = "vpc"
  tags   = merge(var.tags, tomap({ "Name" = var.name }))
}
