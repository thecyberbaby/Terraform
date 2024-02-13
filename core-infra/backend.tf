terraform {
  backend "s3" {
    bucket = "Bucket Name"
    key = "core-infra.tfstate"
    workspace_key_prefix = "core-infra/terraform-state-file/env"
#    dynamodb_table = "core-infra"
    region = "ap-south-1"
    encrypt = true
  }
}
