## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_ips\_count | Count of additional EIPs | `number` | `0` | no |
| ami | Amazon Machine Image | `string` | `""` | no |
| ami\_owner | Owner of the given AMI (ignored if `ami` unset) | `string` | `""` | no |
| applying\_period | The period in seconds over which the specified statistic is applied | `number` | `60` | no |
| associate\_public\_ip\_address | (Optional) Associate a public ip address with an instance in a VPC. Boolean value. | `bool` | `false` | no |
| comparison\_operator | The arithmetic operation to use when comparing the specified Statistic and Threshold. Possible values are: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. | `string` | `"GreaterThanOrEqualToThreshold"` | no |
| create\_default\_security\_group | Create default Security Group with only Egress traffic allowed | `bool` | `true` | no |
| default\_alarm\_action | Default alarm action | `string` | `"action/actions/AWS_EC2.InstanceId.Reboot/1.0"` | no |
| delete\_on\_termination | Whether the volume should be destroyed on instance termination | `bool` | `true` | no |
| disable\_api\_termination | Enable EC2 Instance Termination Protection | `bool` | `false` | no |
| ebs\_device\_name | Name of the EBS device to mount | `list(string)` | <pre>[<br>  "/dev/xvdb",<br>  "/dev/xvdc",<br>  "/dev/xvdd",<br>  "/dev/xvde",<br>  "/dev/xvdf",<br>  "/dev/xvdg",<br>  "/dev/xvdh",<br>  "/dev/xvdi",<br>  "/dev/xvdj",<br>  "/dev/xvdk",<br>  "/dev/xvdl",<br>  "/dev/xvdm",<br>  "/dev/xvdn",<br>  "/dev/xvdo",<br>  "/dev/xvdp",<br>  "/dev/xvdq",<br>  "/dev/xvdr",<br>  "/dev/xvds",<br>  "/dev/xvdt",<br>  "/dev/xvdu",<br>  "/dev/xvdv",<br>  "/dev/xvdw",<br>  "/dev/xvdx",<br>  "/dev/xvdy",<br>  "/dev/xvdz"<br>]</pre> | no |
| ebs\_iops | Amount of provisioned IOPS. This must be set with a volume\_type of io1 | `number` | `0` | no |
| ebs\_optimized | Launched EC2 instance will be EBS-optimized | `bool` | `false` | no |
| ebs\_volume\_count | Count of EBS volumes that will be attached to the instance | `number` | `0` | no |
| ebs\_volume\_size | Size of the EBS volume in gigabytes | `number` | `10` | no |
| ebs\_volume\_type | The type of EBS volume. Can be standard, gp2 or io1 | `string` | `"gp2"` | no |
| enabled | Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| evaluation\_periods | The number of periods over which data is compared to the specified threshold. | `number` | `5` | no |
| iam\_instance\_profile | instance profile | `string` | `null` | no |
| instance\_type | instance\_type | `string` | `"t3.micro"` | no |
| ipv6\_address\_count | Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet (-1 to use subnet default) | `number` | `0` | no |
| ipv6\_addresses | List of IPv6 addresses from the range of the subnet to associate with the primary network interface | `list(string)` | `[]` | no |
| key\_name | SSH key name to be provisioned on the instance | `string` | `null` | no |
| metric\_name | The name for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ec2-metricscollected.html | `string` | `"StatusCheckFailed_Instance"` | no |
| metric\_namespace | The namespace for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-namespaces.html | `string` | `"AWS/EC2"` | no |
| metric\_threshold | The value against which the specified statistic is compared | `number` | `1` | no |
| monitoring | Launched EC2 instance will have detailed monitoring enabled | `bool` | `true` | no |
| name | ec2 name | `string` | n/a | yes |
| private\_ip | Private IP address to associate with the instance in the VPC | `string` | `""` | no |
| region | AWS Region the instance is launched in | `string` | `""` | no |
| root\_encrypted | To encrypt or not to encrypt root volume | `bool` | `true` | no |
| root\_iops | Amount of provisioned IOPS. This must be set if root\_volume\_type is set to `io1` | `number` | `0` | no |
| root\_volume\_size | Size of the root volume in gigabytes | `number` | `10` | no |
| root\_volume\_type | Type of root volume. Can be standard, gp2 or io1 | `string` | `"gp3"` | no |
| security\_group\_ids | List of Security Group IDs allowed to connect to the instance | `list(string)` | `[]` | no |
| source\_dest\_check | Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs | `bool` | `true` | no |
| statistic\_level | The statistic to apply to the alarm's associated metric. Allowed values are: SampleCount, Average, Sum, Minimum, Maximum | `string` | `"Maximum"` | no |
| subnet\_id | Subnet Id | `string` | n/a | yes |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| user\_data | The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; use `user_data_base64` instead | `string` | `null` | no |
| user\_data\_base64 | Can be used instead of `user_data` to pass base64-encoded binary data directly. Use this instead of `user_data` whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption | `string` | `null` | no |
| welcome\_message | Welcome message | `string` | `"  Hi There, welcome to network canary instance!\n  Proudly built in Oakland, California.\n  University of California, Office of the President.\n  Patent Pending.\n"` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance\_id | Instance ID |
| ssm\_command | ssm connection command |
