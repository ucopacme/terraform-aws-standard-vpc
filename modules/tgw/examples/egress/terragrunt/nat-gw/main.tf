# EIP
resource "aws_eip" "this" {
  count = length(var.subnet_ids)
  vpc   = true
  tags  = merge(var.tags, tomap({"Name" = join("-", [var.name, count.index])}))
}
# NAT Gateway
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this[count.index].id
  count         = length(var.subnet_ids)
  subnet_id     = var.subnet_ids[count.index]
  tags          = merge(var.tags, tomap({"Name" = join("-", [var.name, count.index])}))
}
