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
| app\_vpc\_private\_route\_table\_ids | app vpc private route table id | `list(string)` | n/a | yes |
| destination\_cidr\_block | default destination cidr block | `string` | `"0.0.0.0/0"` | no |
| egress\_tgw\_subnet\_ids | egress vpc tgw subnet ids for attachment | `list(string)` | n/a | yes |
| egress\_vpc\_id | egress vpc id | `string` | n/a | yes |
| egress\_vpc\_private\_route\_table\_ids | egress vpc private route table ids | `list(string)` | n/a | yes |
| egress\_vpc\_public\_route\_table\_ids | egress vpc public route table ids | `list(string)` | n/a | yes |
| egress\_vpc\_tgw\_route\_table\_ids | egress vpc tgw route table ids | `list(string)` | n/a | yes |
| enabled | to be or not | `bool` | `true` | no |
| my\_pub\_key | public key material | `string` | `""` | no |
| name | Resource name | `string` | n/a | yes |
| nat\_gw\_ids | list of nat gateway ids | `list(string)` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

No output.
