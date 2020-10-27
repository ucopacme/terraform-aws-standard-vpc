output "id" {
  description = "Security Group Rule ID"
  value       = join("", aws_security_group_rule.this.*.id)
}

