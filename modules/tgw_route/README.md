## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| destination\_cidr\_block | Destination CIDR Block | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_attachment\_id | Transit Gateway Attachment ID | `string` | n/a | yes |
| transit\_gateway\_route\_table\_id | Transit Gateway Route Table ID | `string` | n/a | yes |

## Outputs

No output.
