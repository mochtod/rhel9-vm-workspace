terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "rhel9-vm/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}