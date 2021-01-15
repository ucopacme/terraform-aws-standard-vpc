output "ssm_cmd" {
  value = join(" ", ["aws ssm start-session --target", module.private-ec2.instance_id])
}
