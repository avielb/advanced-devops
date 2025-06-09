terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "envs/prod/terraform.tfstate"
    region         = "us-east-1"
  }
}