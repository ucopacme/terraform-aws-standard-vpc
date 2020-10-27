variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
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
  type        = string
  description = "Transit Gateway Attachment Id"
}

variable "transit_gateway_route_table_id" {
  type        = string
  description = "Transit Gateway route table Id"
}
