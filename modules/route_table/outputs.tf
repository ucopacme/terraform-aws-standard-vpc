output "id" {
  value = join("", aws_route_table.this.*.id)
}
