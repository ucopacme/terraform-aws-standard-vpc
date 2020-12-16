# terraform aws vpn module

this module creates AWS vpn
* [vpn gateway](https://www.terraform.io/docs/providers/aws/r/vpn_gateway.html)
* [customer gateway](https://www.terraform.io/docs/providers/aws/r/customer_gateway.html)
* [vpn connection](https://www.terraform.io/docs/providers/aws/r/vpn_connection.html)
* [optional vpn gateay route propagation](https://www.terraform.io/docs/providers/aws/r/vpn_gateway_route_propagation.html)
* [optional vpn connection route](https://www.terraform.io/docs/providers/aws/r/vpn_connection_route.html)

proudly built in Oakland, California by [UCOP ACME Org](https://github.com/ucopacme), patent pending

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| customer\_gateway\_bgp\_asn | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN) | `number` | `65000` | no |
| customer\_gateway\_ip\_address | The IP address of the gateway's Internet-routable external interface | `string` | n/a | yes |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| name | Resource name | `string` | n/a | yes |
| route\_table\_ids | The IDs of the route tables for which routes from the Virtual Private Gateway will be propagated | `list(string)` | `[]` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| transit\_gateway\_id | Transit Gateway Id for vpn attachment | `string` | `null` | no |
| vpn\_connection\_static\_routes\_destinations | List of CIDR blocks to be used as destination for static routes. Routes to destinations will be propagated to the route tables defined in `route_table_ids` | `list(string)` | `[]` | no |
| vpn\_connection\_static\_routes\_only | If set to `true`, the VPN connection will use static routes exclusively. Static routes must be used for devices that don't support BGP | `string` | `"true"` | no |
| vpn\_connection\_tunnel1\_inside\_cidr | The CIDR block of the inside IP addresses for the first VPN tunnel | `string` | `null` | no |
| vpn\_connection\_tunnel1\_preshared\_key | The preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(\_) | `string` | `null` | no |
| vpn\_connection\_tunnel2\_inside\_cidr | The CIDR block of the inside IP addresses for the second VPN tunnel | `string` | `null` | no |
| vpn\_connection\_tunnel2\_preshared\_key | The preshared key of the second VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero. Allowed characters are alphanumeric characters, periods(.) and underscores(\_) | `string` | `null` | no |
| vpn\_gateway\_amazon\_side\_asn | The Autonomous System Number (ASN) for the Amazon side of the VPN gateway. If you don't specify an ASN, the Virtual Private Gateway is created with the default ASN | `number` | `64512` | no |

## Outputs

| Name | Description |
|------|-------------|
| customer\_gateway\_id | Customer Gateway ID |
| tgw\_attachment\_id | Transit Attachment Id |
| vpn\_connection\_customer\_gateway\_configuration | The configuration information for the VPN connection's Customer Gateway (in the native XML format) |
| vpn\_connection\_id | VPN Connection ID |
| vpn\_connection\_tunnel1\_address | The public IP address of the first VPN tunnel |
| vpn\_connection\_tunnel1\_cgw\_inside\_address | The RFC 6890 link-local address of the first VPN tunnel (Customer Gateway side) |
| vpn\_connection\_tunnel1\_vgw\_inside\_address | The RFC 6890 link-local address of the first VPN tunnel (Virtual Private Gateway side) |
| vpn\_connection\_tunnel2\_address | The public IP address of the second VPN tunnel |
| vpn\_connection\_tunnel2\_cgw\_inside\_address | The RFC 6890 link-local address of the second VPN tunnel (Customer Gateway side) |
| vpn\_connection\_tunnel2\_vgw\_inside\_address | The RFC 6890 link-local address of the second VPN tunnel (Virtual Private Gateway side) |
