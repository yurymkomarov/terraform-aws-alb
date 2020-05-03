terraform {
  experiments = [variable_validation]
}

variable "name" {
  type        = string
  description = "Name that will be used in resources names and tags."
  default     = "terraform-aws-alb"
}

variable "health_check_path" {
  type        = string
  description = "The destination for the health check request."
}

variable "health_check_matcher" {
  type        = string
  description = "The HTTP codes to use when checking for a successful response from a target."
}

variable "certificate_arn" {
  type        = string
  description = "The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
  default     = null
}

variable "ingress_cidr_block" {
  type        = string
  description = "The CIDR IP range that is permitted have access to AWS ALB. Note: a value of 0.0.0.0/0 will allow access from ANY IP address."
  default     = "0.0.0.0/0"

  validation {
    condition     = can(regex("^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])(\\/(0|[1-9]|1[0-9]|2[0-9]|3[0-2]))$", var.ingress_cidr_block))
    error_message = "CIDR parameter must be in the form x.x.x.x/0-32."
  }
}

variable "vpc_id" {
  type        = string
  description = "The identifier of the VPC in which to create the target group."
}

variable "vpc_subnets" {
  type        = list(string)
  description = "A list of subnet IDs to attach to the ALB."
}
