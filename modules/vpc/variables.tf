variable "cidr_block" {
  description = "CIDR for VPC"
  type        = string
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
  description = "Resource name"
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}
