resource "aws_main_route_table_association" "this" {
  count = var.enabled ? 1 : 0

  route_table_id = var.route_table_id
  vpc_id         = var.vpc_id
}
