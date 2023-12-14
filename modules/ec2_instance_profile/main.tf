data "aws_iam_policy_document" "this" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  assume_role_policy = data.aws_iam_policy_document.this.json
  count              = var.enabled ? 1 : 0
  name               = var.name
  tags               = merge(var.tags, tomap({"Name" = var.name}))
}

resource "aws_iam_policy_attachment" "this" {
  count      = var.enabled ? 1 : 0
  name       = var.name
  roles      = [aws_iam_role.this[count.index].name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  # not taggable
}

resource "aws_iam_instance_profile" "this" {
  count = var.enabled ? 1 : 0
  name  = var.name
  role  = aws_iam_role.this[count.index].name
  # not taggable
}
