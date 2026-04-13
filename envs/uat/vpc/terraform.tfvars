project     = "billow"
environment = "uat"

region = "us-west-2"

vpc_cidr = "172.16.0.0/16"

azs = [
  "us-west-2a",
  "us-west-2b"
]

public_subnets = [
  "172.16.1.0/24",
  "172.16.2.0/24"
]

private_subnets = [
  "172.16.101.0/24",
  "172.16.102.0/24"
]

enable_nat_gateway   = true
enable_dns_support   = true
enable_dns_hostnames = true

tags = {
  Project = "billow"
  Env     = "uat"
  Owner   = "DevOps"
}
