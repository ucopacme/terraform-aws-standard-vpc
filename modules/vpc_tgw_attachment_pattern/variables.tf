variable "destination_cidr_block" {
  default     = "10.0.0.0/8"
  type        = string
  description = "route consolidation cidr"
}

variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "name_route_consolidation" {
  type        = string
  description = "name for route table consolidation"
}

variable "name_tgw_attachment" {
  type        = string
  description = "name for transit gateway attachment"
}

variable "name_tgw_route_table_association" {
  type        = string
  description = "name for transit gateway route table association"
}

variable "route_table_id" {
  type        = string
  description = "route table id"
}

variable "subnet_ids" {
  default     = []
  type        = list(string)
  description = "List of Subnet Ids"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "transit_gateway_route_table_id" {
  type        = string
  description = "transit gateway route table id"
}

variable "tgw_id" {
  description = "transit gateway id"
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}
