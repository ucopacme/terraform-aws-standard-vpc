resource "aws_security_group" "this" {
  count       = var.enabled ? 1 : 0
  description = var.description
  name        = var.name
  tags        = merge(var.tags, map("Name", var.name))
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443 # ssm, fix this with vpc endpoints?
    to_port     = 443 # ssm?
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8 # the ICMP type number for 'Echo'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0 # the ICMP type number for 'Echo Reply'
    to_port     = 0 # the ICMP code
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
