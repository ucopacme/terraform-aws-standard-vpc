resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  count                = var.enabled ? 1 : 0
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags                 = merge(var.tags, tomap({"Name" = var.name}))
}

module "vpc_flow_logs" {
  enabled         = var.enabled_flow_logs
  log_destination = var.log_destination
  source          = "git::https://git@github.com/ucopacme/terraform-aws-vpc-flowlogs.git//?ref=v0.0.2"
  tags            = merge(var.tags, tomap({"Name" = var.name}))
  vpc_ids         = [join("", aws_vpc.this.*.id)]
}
