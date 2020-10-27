variable "azs" {
  #default     = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
  default     = ["us-west-2a", "us-west-2b"]
  type        = list(string)
  description = "Availability zones to occupy"
}

variable "cidr_block" {
  type        = string
  description = "CIDR for VPC"
}

variable "enabled" {
  type        = bool
  description = "Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "enabled_flow_logs" {
  type        = bool
  description = "Set to `false` to prevent the module from adding flow log"
  default     = true
}

variable "log_destination" {
  description = "vpc flow logs destination"
  type        = string
}

variable "name" {
  description = "name, to be used as prefix for all resource names"
  type        = string
}

variable "public_subnet_index" {
  description = "index of public subnet"
  default     = 0
  type        = number
}

variable "tgw_subnet_index" {
  description = "index of tgw subnet"
  default     = 1
  type        = number
}

variable "private_subnet_index" {
  description = "index of private subnet"
  default     = 2
  type        = number
}

variable "data_subnet_index" {
  description = "index of data subnet"
  default     = 4
  type        = number
}

variable "subnet_tier_bits" {
  default     = 3
  type        = number
  description = "number of bits to allocate to subnet tiers, 3 means 8 different tier blocks"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}
