project     = "billow"
environment = "prod"

region = "us-west-2"

vpc_cidr = "192.168.0.0/16"

azs = [
  "us-west-2a",
  "us-west-2b"
]

public_subnets = [
  "192.168.1.0/24",
  "192.168.2.0/24"
]

private_subnets = [
  "192.168.101.0/24",
  "192.168.102.0/24"
]

enable_nat_gateway   = true
enable_dns_support   = true
enable_dns_hostnames = true

tags = {
  Project = "billow"
  Env     = "prod"
  Owner   = "DevOps"
}