## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_block | CIDR for VPC | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| enabled\_flow\_logs | Set to `false` to prevent the module from adding flow log | `bool` | `true` | no |
| log\_destination | vpc flow logs destination | `string` | n/a | yes |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_cidr\_block | VPC CIDR Block |
| vpc\_id | VPC ID |
