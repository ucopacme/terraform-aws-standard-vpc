output "instance_id" {
  description = "Instance ID"
  value       = join("", aws_instance.this.*.id)
}

output "sg_id" {
  description = "Instance ID"
  value       = module.ec2_sg.id
}
