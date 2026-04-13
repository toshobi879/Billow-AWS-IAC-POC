terraform {
  backend "s3" {
    bucket         = "billow-tf-state-uat"
    key            = "vpc/vpc.tfstate"
    region         = "us-west-2"
    dynamodb_table = "billow-tf-lock-uat"
    encrypt        = true
  }
}
