output "allocation_id" {
  description = "Allocation ID"
  value       = join("", aws_eip.this.*.id)
}

