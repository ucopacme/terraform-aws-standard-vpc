## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cidr\_blocks | List of CIDR blocks. Cannot be specified with source\_security\_group\_id | `list(string)` | `null` | no |
| description | Resource description | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| from\_port | (REQUIRED)  The start port (or ICMP type number if protocol is icmp or icmpv6 | `string` | n/a | yes |
| ipv6\_cidr\_blocks | List of IPv6 CIDR blocks | `list(string)` | `[]` | no |
| prefix\_list\_ids | List of prefix list IDs (for allowing access to VPC endpoints). Only valid with egress. | `list(string)` | `[]` | no |
| protocol | (REQUIRED)  The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number | `string` | n/a | yes |
| security\_group\_id | (REQUIRED) The security group to apply this rule to | `string` | n/a | yes |
| self | If true, the security group itself will be added as a source to this ingress rule. Cannot be specified with source\_security\_group\_id | `string` | `null` | no |
| source\_security\_group\_id | The security group id to allow access to/from, depending on the type.  Cannot be specified with cidr\_blocks and self. | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| to\_port | (REQUIRED)  The end port (or ICMP code if protocol is icmp) | `string` | n/a | yes |
| type | (REQUIRED) The type of rule being created.  Valid options are ingress (inbound) or egress (outbound). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Security Group Rule ID |
