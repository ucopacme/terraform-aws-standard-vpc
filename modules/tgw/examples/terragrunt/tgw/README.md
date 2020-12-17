## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_tgw\_subnet\_ids | app vpc tgw subnet ids for attachment | `list(string)` | n/a | yes |
| app\_vpc\_id | app vpc id | `string` | n/a | yes |
| app\_vpc\_private\_route\_table\_id | app vpc private route table id | `string` | n/a | yes |
| destination\_cidr\_block | default destination cidr block | `string` | `"0.0.0.0/0"` | no |
| enabled | to be or not | `bool` | `true` | no |
| my\_pub\_key | public key material | `string` | `""` | no |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

No output.
