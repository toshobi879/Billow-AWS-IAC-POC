terraform {
  backend "s3" {
    bucket         = "billow-tf-state-dev"
    key            = "vpc/vpc.tfstate"
    region         = "us-west-2"
    dynamodb_table = "billow-tf-lock-dev"
    encrypt        = true
  }
}
