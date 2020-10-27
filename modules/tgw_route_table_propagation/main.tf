/**
 * # terraform aws transit gateway route table propagation module
 *
 * terraform module to create [AWS transit gateway route table propagation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation) from list of transit gateway attachment ids
 *
 * proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending
 *
 */

resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  count                          = var.enabled ? length(var.transit_gateway_attachment_ids) : 0
  transit_gateway_attachment_id  = var.transit_gateway_attachment_ids[count.index]
  transit_gateway_route_table_id = var.transit_gateway_route_table_id
}
