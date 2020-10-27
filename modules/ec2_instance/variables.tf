variable "ami" {
  description = "Amazon Machine Image"
  type        = string
}

variable "associate_public_ip_address" {
  default     = false
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
  type        = bool
}

variable "desc_sg" {
  description = "security group description"
  type        = string
}

variable "enabled" {
  type        = string
  description = "Set to `false` to prevent the module from creating any resources"
  default     = "true"
}

variable "iam_instance_profile" {
  default     = null
  description = "instance profile"
  type        = string
}


variable "instance_type" {
  default     = "t3.micro"
  description = "instance_type"
  type        = string
}

variable "name_ec2" {
  description = "ec2 name"
  type        = string
}

variable "name_sg" {
  description = "sg name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet Id"
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "vpc_id" {
  description = "VPC Id"
  type        = string
}
