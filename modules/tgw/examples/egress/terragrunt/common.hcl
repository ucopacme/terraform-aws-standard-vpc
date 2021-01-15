inputs = {
  tags = {
    "ucop:application" = "tgw-egress-sample"
    "ucop:createdBy"   = join(" ", ["terraform:", substr(get_aws_caller_identity_arn(), 0, length(get_aws_caller_identity_arn()) - 20)])
    "ucop:environment" = "dev"
    "ucop:group"       = "incredibles"
    "ucop:source"      = join("/", ["https://github.com/ucopacme/terraform-aws-standard-vpc/tree/master/modules/tgw/examples/egress/terragrunt", path_relative_to_include()])
  }
}
