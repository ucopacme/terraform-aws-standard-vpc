# terraform aws transit gateway route table propagation module

terraform module to create [AWS transit gateway route table propagation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation) from list of transit gateway attachment ids

proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_attachment\_ids | [Transit Gateway Attachment Id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation) list | `list(string)` | n/a | yes |
| transit\_gateway\_route\_table\_id | [Transit Gateway Route Table Id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route_table_propagation#transit_gateway_route_table_id) | `string` | n/a | yes |

## Outputs

No output.
