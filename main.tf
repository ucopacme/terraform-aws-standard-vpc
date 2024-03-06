# vpc
module "vpc" {
  cidr_block        = var.cidr_block
  enabled           = var.enabled
  enabled_flow_logs = var.enabled && var.enabled_flow_logs
  log_destination   = var.log_destination
  name              = join("-", [var.name, "vpc"])
  source            = "./modules/vpc"
  tags              = merge(var.tags, tomap({"Name" = var.name}))
}

# vpc data subnets module
module "vpc_data_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_data_subnets
  name               = join("-", [var.name, "vpc-data-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.data_subnet_tier_bits == null ? var.subnet_tier_bits : var.data_subnet_tier_bits, var.data_subnet_index)
  tags               = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id             = module.vpc.vpc_id
}

# data vpc route table
resource "aws_route_table" "data_vpc_route_table" {
  count  = var.enabled && var.enabled_data_subnets ? length(var.azs) : 0
  tags   = merge(var.tags, tomap({"Name" = join("-", [var.name, "data-route-table", count.index])}))
  vpc_id = module.vpc.vpc_id
}

# associate data subnets with data route tables
# Not taggable
resource "aws_route_table_association" "data_subnet_associations" {
  count          = var.enabled && var.enabled_data_subnets ? length(var.azs) : 0
  subnet_id      = module.vpc_data_subnets.subnet_ids[count.index]
  route_table_id = aws_route_table.data_vpc_route_table[count.index].id
}

# vpc private subnets module
module "vpc_private_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_private_subnets
  name               = join("-", [var.name, "vpc-private-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.private_subnet_tier_bits == null ? var.subnet_tier_bits : var.private_subnet_tier_bits, var.private_subnet_index)
  tags               = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id             = module.vpc.vpc_id
}

# private vpc route table
resource "aws_route_table" "private_vpc_route_table" {
  count  = var.enabled && var.enabled_private_subnets ? length(var.azs) : 0
  tags   = merge(var.tags, tomap({"Name" = join("-", [var.name, "private-route-table", count.index])}))
  vpc_id = module.vpc.vpc_id
}

# associate private subnets with private route tables
# Not taggable
resource "aws_route_table_association" "private_subnet_associations" {
  count          = var.enabled && var.enabled_private_subnets ? length(var.azs) : 0
  subnet_id      = module.vpc_private_subnets.subnet_ids[count.index]
  route_table_id = aws_route_table.private_vpc_route_table[count.index].id
}

# vpc public subnets module
module "vpc_public_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_public_subnets
  name               = join("-", [var.name, "vpc-public-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.public_subnet_tier_bits == null ? var.subnet_tier_bits : var.public_subnet_tier_bits, var.public_subnet_index)
  tags               = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id             = module.vpc.vpc_id
}

# public vpc route table
resource "aws_route_table" "public_vpc_route_table" {
  count  = var.enabled && var.enabled_public_subnets ? length(var.azs) : 0
  tags   = merge(var.tags, tomap({"Name" = join("-", [var.name, "public-route-table", count.index])}))
  vpc_id = module.vpc.vpc_id
}

# associate public subnets with public route tables
# Not taggable
resource "aws_route_table_association" "public_subnet_associations" {
  count          = var.enabled && var.enabled_public_subnets ? length(var.azs) : 0
  subnet_id      = module.vpc_public_subnets.subnet_ids[count.index]
  route_table_id = aws_route_table.public_vpc_route_table[count.index].id
}

# public vpc route to igw
# Not taggable
resource "aws_route" "this" {
  count                  = var.enabled && var.enabled_public_subnets && var.enabled_igw && var.enabled_igw_route ? length(var.azs) : 0
  destination_cidr_block = var.igw_route_cidr
  gateway_id             = module.vpc_igw.id
  route_table_id         = aws_route_table.public_vpc_route_table[count.index].id
}

# vpc tgw subnets module
module "vpc_tgw_subnets" {
  availability_zones = var.azs
  enabled            = var.enabled && var.enabled_tgw_subnets
  name               = join("-", [var.name, "vpc-tgw-subnet"])
  new_bits           = "2"
  source             = "./modules/vpc_subnets"
  subnet_cidr        = cidrsubnet(var.cidr_block, var.tgw_subnet_tier_bits == null ? var.subnet_tier_bits : var.tgw_subnet_tier_bits, var.tgw_subnet_index)
  tags               = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id             = module.vpc.vpc_id
}

# tgw vpc route table
resource "aws_route_table" "tgw_vpc_route_table" {
  count  = var.enabled && var.enabled_tgw_subnets ? length(var.azs) : 0
  tags   = merge(var.tags, tomap({"Name" = join("-", [var.name, "tgw-route-table", count.index])}))
  vpc_id = module.vpc.vpc_id
}

# associate tgw subnets with tgw route tables
resource "aws_route_table_association" "tgw_subnet_associations" {
  count          = var.enabled && var.enabled_tgw_subnets ? length(var.azs) : 0
  subnet_id      = module.vpc_tgw_subnets.subnet_ids[count.index]
  route_table_id = aws_route_table.tgw_vpc_route_table[count.index].id
}

# vpc internet gateway
module "vpc_igw" {
  enabled = var.enabled && var.enabled_igw
  name    = join("-", [var.name, "vpc-igw"])
  source  = "./modules/internet_gateway"
  tags    = merge(var.tags, tomap({"Name" = var.name}))
  vpc_id  = module.vpc.vpc_id
}
