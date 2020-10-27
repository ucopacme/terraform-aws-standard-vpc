locals {
  enabled = var.enabled == "true"
}

resource "aws_eip" "this" {
  count = local.enabled ? 1 : 0
  vpc   = true
  tags  = merge(var.tags, map("Name", var.name))
}
