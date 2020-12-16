module "vpc" {
  cidr_block              = "10.0.0.0/21"
  enabled                 = var.enabled
  enabled_data_subnets    = false
  enabled_public_subnets  = true
  enabled_private_subnets = true
  enabled_tgw_subnets     = true
  enabled_flow_logs       = false
  name                    = "app"
  tags                    = merge(var.tags, map("Name", "app"))
  source                  = "./../../../../"
}

resource "aws_security_group" "this" {
  count       = var.enabled ? 1 : 0
  description = "junk security group to test ec2 canary with ssm"
  name        = var.name
  tags        = merge(var.tags, map("Name", var.name))
  vpc_id      = module.vpc.vpc_id

  #  ingress {
  #    description = "allow ssh"
  #    from_port   = 22 # ssm, fix this with vpc endpoints?
  #    to_port     = 22 # ssm?
  #    protocol    = "tcp"
  #    cidr_blocks = ["0.0.0.0/0"]
  #  }

  ingress {
    description = "allow ICMP type number for ping"
    from_port   = 8
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2_role" {
  enabled = var.enabled
  name    = "junk-canary-role"
  tags    = merge(var.tags, map("Name", var.name))
  source  = "./../../../ec2_instance_profile/"
}

resource "aws_key_pair" "this" {
  count      = var.enabled && var.my_pub_key != "" ? 1 : 0
  key_name   = "my-incredible-canary-key"
  public_key = var.my_pub_key
}

module "ec2" {
  associate_public_ip_address = true
  enabled                     = var.enabled
  iam_instance_profile        = module.ec2_role.iam_instance_profile
  #  key_name                    = aws_key_pair.this.key_name
  name               = "junk-canary"
  source             = "./../../../ec2_instance/"
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [aws_security_group.this[0].id]
  tags               = merge(var.tags, map("Name", var.name))
}
