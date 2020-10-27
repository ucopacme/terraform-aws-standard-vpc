# Transit gateway attachment id
output "tgw_attachment_id" {
  value = module.vpc_subnets_tgw_attachment.tgw_attachment_id
}
