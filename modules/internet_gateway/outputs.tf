output "id" {
  value = join("", aws_internet_gateway.this.*.id)
}
