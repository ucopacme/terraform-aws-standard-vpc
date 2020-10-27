output "iam_instance_profile" {
  description = "IAM Instance Profile"
  value       = join("", aws_iam_instance_profile.this.*.name)
}

