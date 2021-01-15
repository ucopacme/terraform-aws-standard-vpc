## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_private\_subnet\_id | Private Subnet Id | `string` | n/a | yes |
| app\_public\_subnet\_id | Public Subnet Id | `string` | n/a | yes |
| app\_vpc\_id | VPC Id | `string` | n/a | yes |
| enabled | to be or not | `bool` | `true` | no |
| enabled\_private\_ec2 | to be or not | `bool` | `true` | no |
| enabled\_public\_ec2 | to be or not | `bool` | `true` | no |
| my\_pub\_key | public key material | `string` | `""` | no |
| name | Resource name | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| ssm\_cmd | n/a |
