data "aws_availability_zones" "available_zones" {
}

# Subnet
resource "aws_subnet" "this" {
  availability_zone = var.availability_zones[count.index]
  # create subnets in desired availability zones.
  # cf https://www.terraform.io/docs/configuration/functions/cidrsubnet.html
  # for description of hwo cidrsubnet function works. Note you have assure that
  # this creates a set of subnets that will fit into vpc cidr block.
  cidr_block              = var.explicit_subnet_cidrs == null ? cidrsubnet(var.subnet_cidr, var.new_bits, count.index) : var.explicit_subnet_cidrs[count.index]
  count                   = var.enabled ? length(var.availability_zones) : 0
  map_public_ip_on_launch = false
  tags                    = merge(var.tags, tomap({"Name" = join("-", [var.name, count.index])}))

  vpc_id = var.vpc_id
}
