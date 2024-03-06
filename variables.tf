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

variable "enabled_igw" {
  type        = bool
  description = "Set to `false` to prevent the module from creating internet gateway"
  default     = true
}

variable "enabled_igw_route" {
  type        = bool
  description = "Set to `false` to prevent the module from creating route for internet gateway"
  default     = true
}

variable "igw_route_cidr" {
  description = "cidr destination for internet route gateway route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enabled_route_table" {
  type        = bool
  description = "Set to `false` to prevent the module from creating vpc route table"
  default     = true
}

variable "enabled_route_table_main_route_table_association" {
  type        = bool
  description = "Set to `false` to prevent the module from associating route table with main route table"
  default     = true
}

variable "enabled_data_subnets" {
  type        = bool
  description = "Set to `false` to prevent the module from creating data subnets"
  default     = true
}

variable "enabled_private_subnets" {
  type        = bool
  description = "Set to `false` to prevent the module from creating private subnets"
  default     = true
}

variable "enabled_public_subnets" {
  type        = bool
  description = "Set to `false` to prevent the module from creating public subnets"
  default     = true
}

variable "enabled_tgw_subnets" {
  type        = bool
  description = "Set to `false` to prevent the module from creating transit gateway subnets"
  default     = true
}

variable "enabled_flow_logs" {
  type        = bool
  description = "Set to `false` to prevent the module from adding flow log"
  default     = true
}

variable "log_destination" {
  default     = null
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

variable "public_subnet_tier_bits" {
  default     = null
  type        = number
  description = "number of bits to allocate to public subnet tier (instead of using generic subnet_tier_bits)"
}

variable "tgw_subnet_tier_bits" {
  default     = null
  type        = number
  description = "number of bits to allocate to tgw subnet tier (instead of using generic subnet_tier_bits)"
}

variable "private_subnet_tier_bits" {
  default     = null
  type        = number
  description = "number of bits to allocate to private subnet tier (instead of using generic subnet_tier_bits)"
}

variable "data_subnet_tier_bits" {
  default     = null
  type        = number
  description = "number of bits to allocate to data subnet tier (instead of using generic subnet_tier_bits)"
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}
