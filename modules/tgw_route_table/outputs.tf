output "transit_gateway_route_table_id" {
  value = join("", aws_ec2_transit_gateway_route_table.this.*.id)
}
