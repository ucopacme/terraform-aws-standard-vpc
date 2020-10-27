variable availability_zones {
  type        = list
  default     = ["us-west-2a", "us-west-2b"]
  description = "List of AWS Availability zones to host subnets"
}
variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "name" {
  description = "Resource name"
  type        = string
}

variable "new_bits" {
  type        = string
  description = "number of additional bits with which to extend the subnet CIDR prefix"
}

variable "subnet_cidr" {
  type        = string
  description = "Subnet CIDR prefix"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}
