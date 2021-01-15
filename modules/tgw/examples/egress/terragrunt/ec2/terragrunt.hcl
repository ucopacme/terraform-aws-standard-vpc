include {
  path = find_in_parent_folders("common.hcl")
}

dependency "app-vpc" {
  config_path = "../vpcs/app/"
  mock_outputs = {
    private_subnet_ids = ["eeny", "meeny", "mynee"]
    public_subnet_ids  = ["this", "that", "other"]
    vpc_id             = "lol"
  }
}

inputs = {
  ec2_zone               = 1
  enabled                = true
  enabled_public_ec2     = false
  name                   = "canary"
  app_public_subnet_ids  = dependency.app-vpc.outputs.public_subnet_ids
  app_private_subnet_ids = dependency.app-vpc.outputs.private_subnet_ids
  app_vpc_id             = dependency.app-vpc.outputs.vpc_id
}
