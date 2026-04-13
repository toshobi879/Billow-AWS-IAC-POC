terraform {
  backend "s3" {
    bucket         = "billow-tf-state-dev"
    key            = "s3/s3.tfstate"
    region         = "us-west-2"
    dynamodb_table = "billow-tf-lock-dev"
    encrypt        = true
  }
}
