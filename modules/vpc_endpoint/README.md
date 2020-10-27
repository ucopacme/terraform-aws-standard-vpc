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
| private\_dns\_enabled | enable private dns | `bool` | `true` | no |
| security\_group\_ids | List of Security Group Ids | `list(string)` | `[]` | no |
| service\_name | Service Name | `string` | n/a | yes |
| subnet\_ids | List of Subnet Ids | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_endpoint\_type | VPC Endpoint Type | `string` | `"Gateway"` | no |
| vpc\_id | VPC ID. | `string` | n/a | yes |

## Outputs

No output.
