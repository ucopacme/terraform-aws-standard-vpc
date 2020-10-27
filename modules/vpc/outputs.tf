# VPC ID
output "vpc_id" {
  value = join("", aws_vpc.this.*.id)
}

# VPC CIDR Block
output "vpc_cidr_block" {
  value = join("", aws_vpc.this.*.cidr_block)
}
