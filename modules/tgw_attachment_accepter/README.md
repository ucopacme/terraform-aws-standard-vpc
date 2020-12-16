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
| transit\_gateway\_attachment\_id | Transit Gateway Attachment ID | `string` | n/a | yes |
| transit\_gateway\_default\_route\_table\_association | Transit Gateway Default Route Table Association | `bool` | `true` | no |
| transit\_gateway\_default\_route\_table\_propagation | Transit Gateway Default Route Table Propagation | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| tgw\_attachment\_acceptor\_id | n/a |
