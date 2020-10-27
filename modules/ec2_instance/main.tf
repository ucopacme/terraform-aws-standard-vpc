locals {
  enabled = var.enabled == "true"
}

resource "aws_instance" "this" {
  ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
  count                       = local.enabled ? 1 : 0
  iam_instance_profile        = var.iam_instance_profile
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  tags                        = merge(var.tags, map("Name", var.name_ec2))
  vpc_security_group_ids      = [module.ec2_sg.id]
}

# subnet security group (sg)
module "ec2_sg" {
  enabled     = var.enabled
  description = var.desc_sg
  name        = var.name_sg
  source      = "../ec2_security_group"
  tags        = merge(var.tags, map("Name", var.name_sg))
  vpc_id      = var.vpc_id
}
