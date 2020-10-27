output "id" {
  value = join("", aws_main_route_table_association.this.*.id)
}
