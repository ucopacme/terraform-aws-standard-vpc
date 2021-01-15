resource "aws_route_table_association" "subnets" {
  count     = length(var.subnet_ids)
  subnet_id = var.subnet_ids[count.index]
  #for_each = toset(var.subnet_ids)
  #subnet_id      = each.value
  route_table_id = var.route_table_id
}
resource "aws_route_table_association" "gateways" {
  count      = length(var.gateway_ids)
  gateway_id = var.gateway_ids[count.index]
  #for_each = toset(var.gateway_ids)
  #gateway_id     = each.value
  route_table_id = var.route_table_id
}
