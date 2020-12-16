output "instance_id" {
  description = "Instance ID"
  value       = join("", aws_instance.this.*.id)
}
output "ssm_command" {
  description = "ssm connection command"
  value       = join(" ", ["aws ssm start-session --target", join(" ", aws_instance.this.*.id)])
}
