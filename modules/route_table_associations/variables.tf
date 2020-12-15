variable "gateway_ids" {
  default = []
  description = "list of gateway Ids"
  type        = list(string)
}
variable "route_table_id" {
  description = "Route Table Id"
  type        = string
}
variable "subnet_ids" {
  default = []
  description = "list of subnet Ids"
  type        = list(string)
}
