variable "additional_ips_count" {
  default     = 0
  description = "Count of additional EIPs"
  type        = number
}

variable "ami" {
  default     = ""
  description = "Amazon Machine Image"
  type        = string
}

variable "ami_owner" {
  default     = ""
  description = "Owner of the given AMI (ignored if `ami` unset)"
  type        = string
}

variable "associate_public_ip_address" {
  default     = false
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
  type        = bool
}
variable "create_default_security_group" {
  default     = true
  description = "Create default Security Group with only Egress traffic allowed"
  type        = bool
}

variable "default_alarm_action" {
  default     = "action/actions/AWS_EC2.InstanceId.Reboot/1.0"
  description = "Default alarm action"
  type        = string
}

variable "delete_on_termination" {
  default     = true
  description = "Whether the volume should be destroyed on instance termination"
  type        = bool
}

variable "disable_api_termination" {
  default     = false
  description = "Enable EC2 Instance Termination Protection"
  type        = bool
}

variable "ebs_device_name" {
  type        = list(string)
  description = "Name of the EBS device to mount"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}

variable "ebs_iops" {
  type        = number
  description = "Amount of provisioned IOPS. This must be set with a volume_type of io1"
  default     = 0
}

variable "ebs_optimized" {
  type        = bool
  description = "Launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "ebs_volume_count" {
  type        = number
  description = "Count of EBS volumes that will be attached to the instance"
  default     = 0
}

variable "ebs_volume_size" {
  type        = number
  description = "Size of the EBS volume in gigabytes"
  default     = 10
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of EBS volume. Can be standard, gp2 or io1"
  default     = "gp2"
}

variable "enabled" {
  type        = bool
  description = "Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "iam_instance_profile" {
  default     = null
  description = "instance profile"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "instance_type"
  type        = string
}

variable "ipv6_address_count" {
  type        = number
  description = "Number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet (-1 to use subnet default)"
  default     = 0
}

variable "ipv6_addresses" {
  type        = list(string)
  description = "List of IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = []
}

variable "monitoring" {
  type        = bool
  description = "Launched EC2 instance will have detailed monitoring enabled"
  default     = true
}

variable "name" {
  description = "ec2 name"
  type        = string
}

variable "private_ip" {
  type        = string
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}

variable "region" {
  type        = string
  description = "AWS Region the instance is launched in"
  default     = ""
}
variable "root_encrypted" {
  type        = bool
  description = "To encrypt or not to encrypt root volume"
  default     = true
}
variable "root_iops" {
  type        = number
  description = "Amount of provisioned IOPS. This must be set if root_volume_type is set to `io1`"
  default     = 0
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root volume in gigabytes"
  default     = 10
}

variable "root_volume_type" {
  type        = string
  description = "Type of root volume. Can be standard, gp2 or io1"
  default     = "gp3"
}

variable "security_group_ids" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = list(string)
  default     = []
}

variable "key_name" {
  type        = string
  description = "SSH key name to be provisioned on the instance"
  default     = null
}

variable "subnet_id" {
  description = "Subnet Id"
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; use `user_data_base64` instead"
  default     = null
}

variable "user_data_base64" {
  type        = string
  description = "Can be used instead of `user_data` to pass base64-encoded binary data directly. Use this instead of `user_data` whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption"
  default     = null
}

variable "welcome_message" {
  type        = string
  default     = <<EOF
  Hi There, welcome to network canary instance!
  Proudly built in Oakland, California.
  University of California, Office of the President.
  Patent Pending.
  EOF
  description = "Welcome message"
}

variable "source_dest_check" {
  type        = bool
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  default     = true
}

## metric stuff here

variable "applying_period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied"
  default     = 60
}

variable "comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. Possible values are: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold."
  default     = "GreaterThanOrEqualToThreshold"
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
  default     = 5
}

variable "metric_name" {
  type        = string
  description = "The name for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ec2-metricscollected.html"
  default     = "StatusCheckFailed_Instance"
}

variable "metric_namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric. Allowed values can be found in https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-namespaces.html"
  default     = "AWS/EC2"
}

variable "metric_threshold" {
  type        = number
  description = "The value against which the specified statistic is compared"
  default     = 1
}

variable "statistic_level" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Allowed values are: SampleCount, Average, Sum, Minimum, Maximum"
  default     = "Maximum"
}
