variable "description" {
  description = "Resource description"
  type        = string
}

variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "cidr_blocks" {
  default     = null
  description = "List of CIDR blocks. Cannot be specified with source_security_group_id"
  type        = list(string)
}

variable "from_port" {
  description = "(REQUIRED)  The start port (or ICMP type number if protocol is icmp or icmpv6"
  type        = string
}

variable "ipv6_cidr_blocks" {
  default     = []
  description = "List of IPv6 CIDR blocks"
  type        = list(string)
}

variable "prefix_list_ids" {
  default     = []
  description = "List of prefix list IDs (for allowing access to VPC endpoints). Only valid with egress."
  type        = list(string)
}

variable "protocol" {
  description = "(REQUIRED)  The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
  type        = string
}

variable "security_group_id" {
  description = "(REQUIRED) The security group to apply this rule to"
  type        = string
}

variable "self" {
  default     = null
  description = " If true, the security group itself will be added as a source to this ingress rule. Cannot be specified with source_security_group_id"
  type        = string
}

variable "source_security_group_id" {
  default     = null
  description = "The security group id to allow access to/from, depending on the type.  Cannot be specified with cidr_blocks and self."
  type        = string
}

variable "to_port" {
  description = "(REQUIRED)  The end port (or ICMP code if protocol is icmp)"
  type        = string
}

variable "type" {
  description = "(REQUIRED) The type of rule being created.  Valid options are ingress (inbound) or egress (outbound)."
  type        = string
}
