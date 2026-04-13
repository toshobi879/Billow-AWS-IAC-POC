project     = "billow"
environment = "dev"

region = "us-west-2"

vpc_cidr = "10.0.0.0/16"

azs = [
  "us-west-2a",
  "us-west-2b"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.101.0/24",
  "10.0.102.0/24"
]

enable_nat_gateway   = true
enable_dns_support   = true
enable_dns_hostnames = true

tags = {
  Project = "billow"
  Env     = "dev"
  Owner   = "DevOps"
}
