output "tgw_id" {
  value = join("", aws_ec2_transit_gateway.this.*.id)
}
output "tgw_arn" {
  value = join("", aws_ec2_transit_gateway.this.*.arn)
}
