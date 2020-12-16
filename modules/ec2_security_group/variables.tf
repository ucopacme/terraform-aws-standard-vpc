variable "description" {
  description = "Resource description"
  type        = string
}

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

variable "vpc_id" {
  description = "vpc id"
  type        = string
}
