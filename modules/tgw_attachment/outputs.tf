output "id" {
  value = join("", aws_ec2_transit_gateway_vpc_attachment.this.*.id)
}
