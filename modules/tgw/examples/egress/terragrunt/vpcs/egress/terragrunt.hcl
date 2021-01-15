include {
  path = find_in_parent_folders("common.hcl")
}

inputs = {
  cidr_block              = "10.100.0.0/21"
  enabled                 = true
  enabled_data_subnets    = false
  enabled_private_subnets = false
  enabled_public_subnets  = true
  enabled_tgw_subnets     = true
  enabled_flow_logs       = false
  name                    = "egress"
}

terraform {
  source = "./../../../../../../../"
}
