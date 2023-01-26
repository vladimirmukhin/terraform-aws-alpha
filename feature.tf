resource "aws_vpc" "secondary" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.env_code
  }
}

resource "aws_subnet" "secondary" {
  vpc_id     = aws_vpc.secondary.id
  cidr_block = var.public_cidr[1]
}

locals {
  secret_password = var.secret_password
}