## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| azs | Availability zones to occupy | `list(string)` | <pre>[<br>  "us-west-2a",<br>  "us-west-2b"<br>]</pre> | no |
| cidr\_block | CIDR for VPC | `string` | n/a | yes |
| data\_subnet\_index | index of data subnet | `number` | `4` | no |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| enabled\_data\_subnets | Set to `false` to prevent the module from creating data subnets | `bool` | `true` | no |
| enabled\_flow\_logs | Set to `false` to prevent the module from adding flow log | `bool` | `true` | no |
| enabled\_igw | Set to `false` to prevent the module from creating internet gateway | `bool` | `true` | no |
| enabled\_igw\_route | Set to `false` to prevent the module from creating route for internet gateway | `bool` | `true` | no |
| enabled\_private\_subnets | Set to `false` to prevent the module from creating private subnets | `bool` | `true` | no |
| enabled\_public\_subnets | Set to `false` to prevent the module from creating public subnets | `bool` | `true` | no |
| enabled\_route\_table | Set to `false` to prevent the module from creating vpc route table | `bool` | `true` | no |
| enabled\_route\_table\_main\_route\_table\_association | Set to `false` to prevent the module from associating route table with main route table | `bool` | `true` | no |
| enabled\_tgw\_subnets | Set to `false` to prevent the module from creating transit gateway subnets | `bool` | `true` | no |
| igw\_route\_cidr | cidr destination for internet route gateway route | `string` | `"0.0.0.0/0"` | no |
| log\_destination | vpc flow logs destination | `string` | `null` | no |
| name | name, to be used as prefix for all resource names | `string` | n/a | yes |
| private\_subnet\_index | index of private subnet | `number` | `2` | no |
| public\_subnet\_index | index of public subnet | `number` | `0` | no |
| subnet\_tier\_bits | number of bits to allocate to subnet tiers, 3 means 8 different tier blocks | `number` | `3` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| tgw\_subnet\_index | index of tgw subnet | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| data\_route\_table\_id | data route table id |
| data\_subnet\_ids | list of data subnet ids |
| igw\_id | internet gateway id |
| private\_route\_table\_id | private route table id |
| private\_subnet\_ids | list of private subnet ids |
| public\_route\_table\_id | public route table id |
| public\_subnet\_ids | list of public subnet ids |
| tgw\_route\_table\_id | tgw route table id |
| tgw\_subnet\_ids | list of tgw subnet ids |
| vpc\_id | virtual private cloud id |
