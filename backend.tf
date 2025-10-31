terraform {
  backend "s3" {
    bucket         = "pk-state-bucket" # 
    key            = "envs/demo/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "pk-lock-table"
    encrypt        = true
  }
}
