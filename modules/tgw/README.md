## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| amazon\_side\_asn | (Optional) Private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is 64512 to 65534 for 16-bit ASNs | `string` | `"64512"` | no |
| auto\_accept\_shared\_attachments | - (Optional) Whether resource attachment requests are automatically accepted. Valid values: disable, enable. | `string` | `"disable"` | no |
| default\_route\_table\_association | (Optional) Whether resource attachments are automatically associated with the default association route table. Valid values: disable, enable. | `string` | `"enable"` | no |
| default\_route\_table\_propagation | (Optional) Whether resource attachments automatically propagate routes to the default propagation route table. Valid values: disable, enable. | `string` | `"enable"` | no |
| description | Description of the Transit Gateway | `string` | `null` | no |
| dns\_support | (Optional) Whether DNS support is enabled. Valid values: disable, enable. Default value: enable. | `string` | `"enable"` | no |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| name | Resource name | `string` | `"junk"` | no |
| ram\_enabled | Set to `true to enable ram` | `bool` | `false` | no |
| ram\_principals | list of ram principals to share tgw | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| vpn\_ecmp\_support | (Optional) Whether VPN Equal Cost Multipath Protocol support is enabled. Valid values: disable, enable | `string` | `"enable"` | no |

## Outputs

| Name | Description |
|------|-------------|
| tgw\_arn | n/a |
| tgw\_id | n/a |
