data "terraform_remote_state" "level1" {
  backend = "s3"

  config = {
    bucket = "terraform-remote-state-abc123abc"
    key    = "level1.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "rds_password" {
  name = "rds/password"
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = data.aws_secretsmanager_secret.rds_password.id
}
