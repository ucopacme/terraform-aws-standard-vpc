## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | List of AWS Availability zones to host subnets | `list` | <pre>[<br>  "us-west-2a",<br>  "us-west-2b"<br>]</pre> | no |
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| name | Resource name | `string` | n/a | yes |
| new\_bits | number of additional bits with which to extend the subnet CIDR prefix | `string` | n/a | yes |
| subnet\_cidr | Subnet CIDR prefix | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_ids | List of subnet IDs |
