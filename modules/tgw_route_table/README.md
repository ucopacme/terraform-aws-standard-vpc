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
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_id | Transit Gateway ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| transit\_gateway\_route\_table\_id | n/a |
