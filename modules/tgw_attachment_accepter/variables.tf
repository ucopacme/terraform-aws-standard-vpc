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

variable "transit_gateway_attachment_id" {
  description = "Transit Gateway Attachment ID"
  type        = string
}

variable "transit_gateway_default_route_table_association" {
  default     = true
  description = "Transit Gateway Default Route Table Association"
  type        = bool
}

variable "transit_gateway_default_route_table_propagation" {
  default     = true
  description = "Transit Gateway Default Route Table Propagation"
  type        = bool
}
