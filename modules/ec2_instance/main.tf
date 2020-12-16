data "aws_ami" "default" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

data "aws_ami" "info" {
  filter {
    name   = "image-id"
    values = [local.ami]
  }

  owners = [local.ami_owner]
}

data "aws_caller_identity" "default" {
}

data "aws_region" "default" {
}

data "aws_partition" "default" {
}

data "aws_subnet" "default" {
  id = var.subnet_id
}

locals {
  ami                  = var.ami != "" ? var.ami : join("", data.aws_ami.default.*.image_id)
  ami_owner            = var.ami != "" ? var.ami_owner : join("", data.aws_ami.default.*.owner_id)
  ebs_iops             = var.ebs_volume_type == "io1" ? var.ebs_iops : "0"
  region               = var.region != "" ? var.region : data.aws_region.default.name
  root_iops            = var.root_volume_type == "io1" ? var.root_iops : "0"
  root_volume_type     = var.root_volume_type != "" ? var.root_volume_type : data.aws_ami.info.root_device_type
  security_group_count = var.create_default_security_group ? 1 : 0
}


resource "aws_instance" "this" {
  ami                         = local.ami
  associate_public_ip_address = var.associate_public_ip_address
  count                       = var.enabled ? 1 : 0
  disable_api_termination     = var.disable_api_termination
  ebs_optimized               = var.ebs_optimized
  iam_instance_profile        = var.iam_instance_profile
  instance_type               = var.instance_type
  ipv6_address_count          = var.ipv6_address_count < 0 ? null : var.ipv6_address_count
  ipv6_addresses              = length(var.ipv6_addresses) == 0 ? null : var.ipv6_addresses
  key_name                    = var.key_name
  monitoring                  = var.monitoring
  private_ip                  = var.private_ip
  root_block_device {
    delete_on_termination = var.delete_on_termination
    encrypted             = var.root_encrypted
    iops                  = local.root_iops
    volume_type           = local.root_volume_type
    volume_size           = var.root_volume_size
  }
  source_dest_check      = var.source_dest_check
  subnet_id              = var.subnet_id
  tags                   = merge(var.tags, map("Name", var.name))
  user_data              = var.user_data
  user_data_base64       = var.user_data_base64
  vpc_security_group_ids = var.security_group_ids
}
