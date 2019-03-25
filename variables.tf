variable "vpc_name" {
  description = "The name of the VPC."
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC."
}

variable "vpc_instance_tenancy" {
  default     = "default"
  description = "Tenancy of instances spun up within the VPC (`default`, `dedicated`).)"
}

variable "region" {
  description = "The region in which to deploy the VPC."
}

variable "vpc_enable_dns_hostnames" {
  default     = true
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults to true."
}

variable "vpc_flow_log_retention_days" {
  default     = 180
  description = "The number of days to retain VPC flow logs in CloudWatch for. Defaults to 180."
}

variable "vpc_flow_log_traffic_type" {
  default     = "ALL"
  description = "The type of traffic ('ACCEPT', 'REJECT', or 'ALL') to log. Defaults to 'ALL'."
}

variable "s3_endpoint" {
  default     = true
  description = "Place an S3 VPC endpoint in this VPC. If set to true, you will also need to set `gateway_vpce_route_table_ids`"
}

variable "ssm_endpoint" {
  default     = true
  description = "Place an SSM VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "ssmmessages_endpoint" {
  default     = true
  description = "Place an SSM Messages VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "ec2_endpoint" {
  default     = true
  description = "Place an EC2 VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "ec2messages_endpoint" {
  default     = true
  description = "Place an EC2 Messages VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "logs_endpoint" {
  default     = true
  description = "Place a CloudWatch Logs VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "monitoring_endpoint" {
  default     = false
  description = "Place a CloudWatch Monitoring VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "sns_endpoint" {
  default     = false
  description = "Place an SNS VPC endpoint in this VPC. If set to true, you will also need to set `interface_vpce_security_group_ids` and `interface_vpce_subnet_ids`"
}

variable "gateway_vpce_route_table_ids" {
  default     = []
  description = "A list of one or more route table IDs for Gateway VPC Endpoint rules to be added to."
}

variable "interface_vpce_source_security_group_count" {
  default     = 0
  description = "The number of security group IDs given in interface_vpce_source_security_group_ids (to workaround https://github.com/hashicorp/terraform/issues/12570)."
}

variable "interface_vpce_source_security_group_ids" {
  default     = []
  description = "A list of security group IDs that will be allowed to reach the Interface VPCs"
}

variable "interface_vpce_subnet_ids" {
  default     = []
  description = "A list of subnet IDs that all Interface VPC endpoints will be attached to"
}

variable "common_tags" {
  default = {}
}