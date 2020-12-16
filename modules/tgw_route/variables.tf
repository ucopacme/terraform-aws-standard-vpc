variable "enabled" {
  type        = bool
  description = "Set to `false` to prevent the module from creating any resources"
  default     = true
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

variable "destination_cidr_block" {
  type        = string
  description = "Destination CIDR Block"
}

variable "transit_gateway_attachment_id" {
  type        = string
  description = "Transit Gateway Attachment ID"
}

variable "transit_gateway_route_table_id" {
  type        = string
  description = "Transit Gateway Route Table ID"
}
