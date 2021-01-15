variable "name" {
  description = "Resource name"
  type        = string
}
variable "subnet_ids" {
  type        = list(string)
  description = "list of subnet ids to plance nat gw"
}
variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}
