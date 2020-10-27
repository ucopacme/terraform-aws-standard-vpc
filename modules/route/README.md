## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| destination\_cidr\_block | (REQUIRED) destination CIDR block | `string` | n/a | yes |
| egress\_only\_gateway\_id | VPC Egress Only Internet Gateway Id | `string` | `null` | no |
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| gateway\_id | VPC or VPN internet gateway Id | `string` | `null` | no |
| instance\_id | EC2 instance Id | `string` | `null` | no |
| name | Resource name | `string` | n/a | yes |
| nat\_gateway\_id | VPC NAT gateway Id | `string` | `null` | no |
| network\_interface\_id | EC2 network interface Id | `string` | `null` | no |
| route\_table\_id | (REQUIRED) routing table Id | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_id | Transit Gateway Id | `string` | `null` | no |
| vpc\_peering\_connection\_id | VPC peering connection Id | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | n/a |
