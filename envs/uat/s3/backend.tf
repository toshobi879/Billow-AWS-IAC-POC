terraform {
  backend "s3" {
    bucket         = "billow-tf-state-uat"
    key            = "s3/s3.tfstate"
    region         = "us-west-2"
    dynamodb_table = "billow-tf-lock-uat"
    encrypt        = true
  }
}
