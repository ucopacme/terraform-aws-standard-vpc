# vpc
module "vpc" {
  cidr_block        = var.cidr_block
  enabled           = var.enabled
  enabled_flow_logs = var.enabled && var.enabled_flow_logs
  log_destination   = var.log_destination
  name              = join("-", [var.name, "vpc"])
  source            = "./modules/vpc"
  tags              = merge(var.tags, map("Name", var.name))
}

# vpc data subnets module
module "vpc_data_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_data_subnets
  name               = join("-", [var.name, "vpc-data-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.subnet_tier_bits, var.data_subnet_index)
  tags               = merge(var.tags, map("Name", var.name))
  vpc_id             = module.vpc.vpc_id
}

# data vpc route table
module "data_vpc_route_table" {
  enabled = var.enabled && var.enabled_data_subnets
  name    = join("-", [var.name, "data-route-table"])
  source  = "./modules/route_table"
  tags    = merge(var.tags, map("Name", var.name))
  vpc_id  = module.vpc.vpc_id
}

# associate data subnets with data route table
module "data_vpc_route_table_subnet_associations" {
  route_table_id = module.data_vpc_route_table.id
  source         = "./modules/route_table_associations"
  subnet_ids     = module.vpc_data_subnets.subnet_ids
}

# vpc private subnets module
module "vpc_private_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_private_subnets
  name               = join("-", [var.name, "vpc-private-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.subnet_tier_bits, var.private_subnet_index)
  tags               = merge(var.tags, map("Name", var.name))
  vpc_id             = module.vpc.vpc_id
}

# private vpc route table
module "private_vpc_route_table" {
  enabled = var.enabled && var.enabled_private_subnets
  name    = join("-", [var.name, "private-route-table"])
  source  = "./modules/route_table"
  tags    = merge(var.tags, map("Name", var.name))
  vpc_id  = module.vpc.vpc_id
}

# associate private subnets with private route table
module "private_vpc_route_table_subnet_associations" {
  route_table_id = module.private_vpc_route_table.id
  source         = "./modules/route_table_associations"
  subnet_ids     = module.vpc_private_subnets.subnet_ids
}

# vpc public subnets module
module "vpc_public_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_public_subnets
  name               = join("-", [var.name, "vpc-public-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.subnet_tier_bits, var.public_subnet_index)
  tags               = merge(var.tags, map("Name", var.name))
  vpc_id             = module.vpc.vpc_id
}

# public vpc route table
module "public_vpc_route_table" {
  enabled = var.enabled && var.enabled_public_subnets
  name    = join("-", [var.name, "public-route-table"])
  source  = "./modules/route_table"
  tags    = merge(var.tags, map("Name", var.name))
  vpc_id  = module.vpc.vpc_id
}

# associate public subnets with public route table
module "public_vpc_route_table_subnet_associations" {
  route_table_id = module.public_vpc_route_table.id
  source         = "./modules/route_table_associations"
  subnet_ids     = module.vpc_public_subnets.subnet_ids
}

# public vpc route to igw
module "public_vpc_route_to_igw" {
  destination_cidr_block = var.igw_route_cidr
  enabled                = var.enabled && var.enabled_public_subnets && var.enabled_igw && var.enabled_igw_route
  gateway_id             = module.vpc_igw.id
  route_table_id         = module.public_vpc_route_table.id
  source                 = "./modules/route"
}

# vpc tgw subnets module
module "vpc_tgw_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_tgw_subnets
  name               = join("-", [var.name, "vpc-tgw-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.subnet_tier_bits, var.tgw_subnet_index)
  tags               = merge(var.tags, map("Name", var.name))
  vpc_id             = module.vpc.vpc_id
}

# tgw vpc route table
module "tgw_vpc_route_table" {
  enabled = var.enabled && var.enabled_tgw_subnets
  name    = join("-", [var.name, "tgw-route-table"])
  source  = "./modules/route_table"
  tags    = merge(var.tags, map("Name", var.name))
  vpc_id  = module.vpc.vpc_id
}

#associate tgw subnets with tgw route table
module "tgw_vpc_route_table_subnet_associations" {
  route_table_id = module.tgw_vpc_route_table.id
  source         = "./modules/route_table_associations"
  subnet_ids     = module.vpc_tgw_subnets.subnet_ids
}

# vpc internet gateway
module "vpc_igw" {
  enabled = var.enabled && var.enabled_igw
  name    = join("-", [var.name, "vpc-igw"])
  source  = "./modules/internet_gateway"
  tags    = merge(var.tags, map("Name", var.name))
  vpc_id  = module.vpc.vpc_id
}
