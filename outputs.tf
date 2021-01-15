output igw_id {
  description = "internet gateway id"
  value       = module.vpc_igw.id
}
output vpc_id {
  description = "virtual private cloud id"
  value       = module.vpc.vpc_id
}
output data_route_table_ids {
  description = "data route table ids"
  value       = "${aws_route_table.data_vpc_route_table.*.id}"
}
output data_subnet_ids {
  description = "list of data subnet ids"
  value       = module.vpc_data_subnets.subnet_ids
}
output private_route_table_ids {
  description = "private route table ids"
  value       = "${aws_route_table.private_vpc_route_table.*.id}"
}
output private_subnet_ids {
  description = "list of private subnet ids"
  value       = module.vpc_private_subnets.subnet_ids
}
output public_route_table_ids {
  description = "public route table ids"
  value       = "${aws_route_table.public_vpc_route_table.*.id}"
}
output public_subnet_ids {
  description = "list of public subnet ids"
  value       = module.vpc_public_subnets.subnet_ids
}
output tgw_route_table_ids {
  description = "tgw route table ids"
  value       = "${aws_route_table.tgw_vpc_route_table.*.id}"
}
output tgw_subnet_ids {
  description = "list of tgw subnet ids"
  value       = module.vpc_tgw_subnets.subnet_ids
}
