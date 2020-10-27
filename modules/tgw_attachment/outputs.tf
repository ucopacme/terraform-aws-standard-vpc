output "tgw_attachment_id" {
  value = join("", aws_ec2_transit_gateway_vpc_attachment.this.*.id)
}
