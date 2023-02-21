terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-abc123abc"
    key            = "level2.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-state-lock"
  }
}
