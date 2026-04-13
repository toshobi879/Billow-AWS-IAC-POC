variable "project" {}
variable "environment" {}
variable "vpc_cidr" {}
variable "azs" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "enable_nat_gateway" { type = bool }
variable "enable_dns_support" { type = bool }
variable "enable_dns_hostnames" { type = bool }
variable "tags" { type = map(string) }
variable "region" {
  type = string
}
