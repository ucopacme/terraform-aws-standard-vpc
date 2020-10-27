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

variable "private_dns_enabled" {
  default     = true
  type        = bool
  description = "enable private dns"
}

variable "security_group_ids" {
  default     = []
  type        = list(string)
  description = "List of Security Group Ids"
}

variable "service_name" {
  type        = string
  description = "Service Name"
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

variable "vpc_endpoint_type" {
  default     = "Gateway"
  type        = string
  description = "VPC Endpoint Type"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}
