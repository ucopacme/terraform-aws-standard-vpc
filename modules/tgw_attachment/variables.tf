variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}
variable "name" {
  description = "Resource name"
  type        = string
}

variable subnet_ids {
  type        = list
  description = "List of vpc subnet ids"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "transit_gateway_default_route_table_association" {
  default     = false
  type        = string
  description = "Transit Gateway default route table association"
}

variable "transit_gateway_default_route_table_propagation" {
  default     = false
  type        = string
  description = "Transit Gateway default route table propagation"
}

variable "transit_gateway_id" {
  type        = string
  description = "Transit Gateway ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}
