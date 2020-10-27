locals {
  enabled = var.enabled == "true"
}

resource "aws_cloudwatch_dashboard" "this" {
  count          = local.enabled ? 1 : 0
  dashboard_name = var.dashboard_name
  dashboard_body = file("${path.module}/tgw-dashboard.json")
  # tags           = merge(var.tags, map("Name", var.name))
}
