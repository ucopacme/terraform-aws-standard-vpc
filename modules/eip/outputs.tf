output "allocation_id" {
  description = "Allocation ID"
  value       = join("", aws_eip.this.*.id)
}

output "public_ip" {
  description = "Public IP address"
  value       = join("", aws_eip.this.*.public_ip)
}
