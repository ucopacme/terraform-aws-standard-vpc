output "tgw_rt_association_id" {
  value = join("", aws_ec2_transit_gateway_route_table_association.this.*.id)
}
