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

variable "dashboard_template" {
  type        = string
  description = "Dashboard body in json format"
}

variable "dashboard_name" {
  type        = string
  description = "Dashboard Name"
}
