terraform {
  backend "s3" {
    bucket         = "pdnt-terraform-remote-state"
    key            = "terraform-module/rentzone/terraform.tfstate"
    region         = "us-east-1"
    profile        = "terraform-user"
    dynamodb_table = "terraform-state-lock"
  }
}