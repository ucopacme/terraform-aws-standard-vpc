## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dashboard\_name | Dashboard Name | `string` | n/a | yes |
| dashboard\_template | Dashboard body in json format | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

No output.
