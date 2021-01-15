include {
  path = find_in_parent_folders("common.hcl")
}

dependency "vpc" {
  config_path = "../vpcs/egress"
  mock_outputs = {
    public_subnet_ids = ["this", "that", "other"]
  }
}

inputs = {
  enabled    = true
  name       = "public-egress-nat-gw"
  subnet_ids = dependency.vpc.outputs.public_subnet_ids
}
