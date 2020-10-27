## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| name | Resource name | `string` | n/a | yes |
| subnet\_ids | List of vpc subnet ids | `list` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_default\_route\_table\_association | Transit Gateway default route table association | `string` | `false` | no |
| transit\_gateway\_default\_route\_table\_propagation | Transit Gateway default route table propagation | `string` | `false` | no |
| transit\_gateway\_id | Transit Gateway ID | `string` | n/a | yes |
| vpc\_id | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| tgw\_attachment\_id | n/a |
