resource "aws_cloudwatch_dashboard" "this" {
  count          = var.enabled ? 1 : 0
  dashboard_name = var.dashboard_name
  dashboard_body = file("${path.module}/tgw-dashboard.json")
  # tags           = merge(var.tags, tomap({"Name" = var.name}))
}
