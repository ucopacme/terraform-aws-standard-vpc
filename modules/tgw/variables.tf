variable "amazon_side_asn" {
  default     = "64512"
  description = " (Optional) Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs"
}

variable "auto_accept_shared_attachments" {
  default     = "disable"
  description = "- (Optional) Whether resource attachment requests are automatically accepted. Valid values: disable, enable."
}

variable "default_route_table_association" {
  default     = "enable"
  description = "(Optional) Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. "
}

variable "default_route_table_propagation" {
  default     = "enable"
  description = "(Optional) Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable."
}

variable "description" {
  default     = null
  description = "Description of the Transit Gateway"
  type        = string
}

variable "dns_support" {
  default     = "enable"
  description = "(Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable."
}

variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "name" {
  default     = "junk"
  description = "Resource name"
  type        = string
}

variable "ram_enabled" {
  type        = string
  description = "Set to `true to enable ram"
  default     = "false"
}

variable "ram_principals" {
  type        = list(string)
  description = "list of ram principals to share tgw"
  default     = []
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpn_ecmp_support" {
  default     = "enable"
  description = "(Optional) Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable"
}
