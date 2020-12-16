## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| destination\_cidr\_block | route consolidation cidr | `string` | `"10.0.0.0/8"` | no |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| name\_route\_consolidation | name for route table consolidation | `string` | n/a | yes |
| name\_tgw\_attachment | name for transit gateway attachment | `string` | n/a | yes |
| name\_tgw\_route\_table\_association | name for transit gateway route table association | `string` | n/a | yes |
| route\_table\_id | route table id | `string` | n/a | yes |
| subnet\_ids | List of Subnet Ids | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| tgw\_id | transit gateway id | `string` | n/a | yes |
| transit\_gateway\_route\_table\_id | transit gateway route table id | `string` | n/a | yes |
| vpc\_id | VPC ID. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| tgw\_attachment\_id | Transit gateway attachment id |
