## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ami | Amazon Machine Image | `string` | n/a | yes |
| associate\_public\_ip\_address | (Optional) Associate a public ip address with an instance in a VPC. Boolean value. | `bool` | `false` | no |
| desc\_sg | security group description | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `string` | `"true"` | no |
| iam\_instance\_profile | instance profile | `string` | `null` | no |
| instance\_type | instance\_type | `string` | `"t3.micro"` | no |
| name\_ec2 | ec2 name | `string` | n/a | yes |
| name\_sg | sg name | `string` | n/a | yes |
| subnet\_id | Subnet Id | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpc\_id | VPC Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | Instance ID |
| sg\_id | Instance ID |
