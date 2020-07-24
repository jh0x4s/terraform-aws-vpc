locals {
  gateway_services = ["dynamodb", "s3"]

  interface_endpoints_to_create = [
    for service in var.aws_vpce_services :
    service if ! contains(local.gateway_services, service)
  ]

  gateway_endpoints_to_create = setintersection(var.aws_vpce_services, local.gateway_services)

  # Creates an exhaustive list of tuples of the form [<security_group_id>, <port>]
  # where each <security_group_id> is one of the externally provided Security Group IDs
  # and <port> is one of the custom vpce services ports
  sg_id_to_port_mapping = tolist(setproduct(var.interface_vpce_source_security_group_ids, var.custom_vpce_services[*].port))

  aws_interface_endpoint_dns = aws_vpc_endpoint.aws_interface_vpc_endpoints.*.dns_entry[0].dns_name
  aws_gateway_endpoint_dns = aws_vpc_endpoint.aws_gateway_vpc_endpoints.*.dns_entry[0].dns_name
  custom_endpoint_dns = aws_vpc_endpoint.custom_vpc_endpoints.*.dns_entry[0].dns_name
  endpoint_dns = concat(local.aws_interface_endpoint_dns, local.aws_gateway_endpoint_dns, local.custom_endpoint_dns)

  vpce_subnet_combinations = [
    # in pair, element zero is a VPCE ID and element one is a Subnet ID,
    # in all unique combinations.
    for pair in setproduct(aws_vpc_endpoint.aws_interface_vpc_endpoints.*.id, var.interface_vpce_subnet_ids) : {
      vpce_id   = pair[0]
      subnet_id = pair[1]
    }
  ]

}
