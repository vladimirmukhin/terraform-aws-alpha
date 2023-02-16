terraform {
  backend "s3" {
    bucket = "terraform-remote-state-abc123abc"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
