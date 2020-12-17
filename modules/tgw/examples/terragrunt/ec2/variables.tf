variable "app_public_subnet_id" {
  description = "Public Subnet Id"
  type        = string
}
variable "app_vpc_id" {
  description = "VPC Id"
  type        = string
}
variable "enabled" {
  description = "to be or not"
  type        = bool
  default     = true
}
variable "my_pub_key" {
  description = "public key material"
  type        = string
  default     = ""
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
