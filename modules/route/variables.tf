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

# https://www.terraform.io/docs/providers/aws/r/route.html#route_table_id
# Note that the default route, mapping the VPC's CIDR block to "local", is created implicitly and cannot be specified.
# The following arguments are supported:

variable "route_table_id" {
  type        = string
  description = "(REQUIRED) routing table Id"
}

# we'll just do ipv4 for now
variable "destination_cidr_block" {
  type        = string
  description = "(REQUIRED) destination CIDR block"
}

# One of the following target arguments must be supplied:

variable "egress_only_gateway_id" {
  default     = null
  description = "VPC Egress Only Internet Gateway Id"
  type        = string
}

variable "gateway_id" {
  default     = null
  description = "VPC or VPN internet gateway Id"
  type        = string
}

variable "instance_id" {
  default     = null
  description = "EC2 instance Id"
  type        = string
}

variable "nat_gateway_id" {
  default     = null
  description = "VPC NAT gateway Id"
  type        = string
}

variable "network_interface_id" {
  default     = null
  description = "EC2 network interface Id"
  type        = string
}

variable "transit_gateway_id" {
  default     = null
  description = "Transit Gateway Id"
  type        = string
}

variable "vpc_peering_connection_id" {
  default     = null
  description = " VPC peering connection Id"
  type        = string
}
