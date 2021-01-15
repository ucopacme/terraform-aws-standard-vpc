variable "app_private_subnet_ids" {
  description = "List of Private Subnet Ids"
  type        = list(string)
}
variable "app_public_subnet_ids" {
  description = "List of Public Subnet Ids"
  type        = list(string)
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
variable "enabled_private_ec2" {
  description = "to be or not"
  type        = bool
  default     = true
}
variable "enabled_public_ec2" {
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
