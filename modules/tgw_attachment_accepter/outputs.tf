output "tgw_attachment_acceptor_id" {
  value = join("", aws_ec2_transit_gateway_vpc_attachment_accepter.this.*.id)
}
