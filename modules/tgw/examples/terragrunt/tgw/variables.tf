variable "app_vpc_id" {
  description = "app vpc id"
  type        = string
}
variable "app_vpc_private_route_table_id" {
  description = "app vpc private route table id"
  type        = string
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
variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

