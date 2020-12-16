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

variable "allocation_id" {
  type        = string
  description = "Allocation ID"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}
