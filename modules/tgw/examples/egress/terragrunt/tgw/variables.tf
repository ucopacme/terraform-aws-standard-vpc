variable "app_vpc_id" {
  description = "app vpc id"
  type        = string
}
variable "app_vpc_private_route_table_ids" {
  description = "app vpc private route table id"
  type        = list(string)
}
variable "app_tgw_subnet_ids" {
  description = "app vpc tgw subnet ids for attachment"
  type        = list(string)
}
variable "destination_cidr_block" {
  default     = "0.0.0.0/0"
  description = "default destination cidr block"
  type        = string
}
variable "egress_vpc_id" {
  description = "egress vpc id"
  type        = string
}
variable "egress_vpc_private_route_table_ids" {
  description = "egress vpc private route table ids"
  type        = list(string)
}
variable "egress_vpc_public_route_table_ids" {
  description = "egress vpc public route table ids"
  type        = list(string)
}
variable "egress_vpc_tgw_route_table_ids" {
  description = "egress vpc tgw route table ids"
  type        = list(string)
}
variable "egress_tgw_subnet_ids" {
  description = "egress vpc tgw subnet ids for attachment"
  type        = list(string)
}
variable "enabled" {
  description = "to be or not"
  type        = bool
  default     = true
}
variable "my_pub_key" {
  description = "public key material"
  type        = string
  default     = ""
}
variable "name" {
  description = "Resource name"
  type        = string
}
variable "nat_gw_ids" {
  description = "list of nat gateway ids"
  type        = list(string)
}
variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

