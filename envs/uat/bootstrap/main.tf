module "bootstrap" {
  source = "../../../modules/bootstrap"

  backend_bucket_name = var.backend_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  aws_region          = var.aws_region
  environment         = var.environment
}
