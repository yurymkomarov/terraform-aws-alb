# AWS Application Load balancer

This module provides a Load Balancer resources:
- application load balancer
- HTTP/HTTPS listeners
- target group
- security group

## Input variables
- `name` - Name that will be used in resources names and tags
- `health_check_path` - The destination for the health check request
- `health_check_matcher` - The HTTP codes to use when checking for a successful response from a target
- `certificate_arn` - The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS
- `ingress_cidr_block` - The CIDR IP range that is permitted have access to AWS ALB. Note: a value of 0.0.0.0/0 will allow access from ANY IP address
- `vpc_id` - The identifier of the VPC in which to create the target group
- `vpc_subnets` - A list of subnet IDs to attach to the ALB
- `create_route53_record` - Create AWS Route53 CNAME record for the ALB
- `route53_record_name` - The name of the Route53 record
- `route53_record_ttl` - The TTL of the Route53 record
- `route53_zone_id` - The ID of the hosted zone to contain this record

## Output variables
- `lb`
    - `id` - The ARN of the load balancer
    - `arn` - The ARN of the load balancer
    - `arn_suffix` - The ARN suffix for use with CloudWatch Metrics
    - `dns_name` - The DNS name of the load balancer
    - `zone_id` - The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)
- `target_group`
    - `id` - The ARN of the Target Group
    - `arn` - The ARN of the Target Group
    - `arn_suffix` - The ARN suffix for use with CloudWatch Metrics
    - `name` - The name of the Target Group
- `security_group`
    - `id` - The ID of the security group
    - `arn` - The ARN of the security group
    - `vpc_id` - The VPC ID
    - `owner_id` - The owner ID
    - `name` - The name of the security group
    - `description` - The description of the security group
    - `ingress` - The ingress rules
    - `egress` - The egress rules
- `route53_record`
    - `name` - The name of the record
    - `fqdn` - FQDN built using the zone domain and name
