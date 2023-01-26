resource "aws_vpc" "secondary" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.env_code
  }
}