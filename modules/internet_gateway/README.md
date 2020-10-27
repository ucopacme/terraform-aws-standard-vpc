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
| vpc\_id | VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
