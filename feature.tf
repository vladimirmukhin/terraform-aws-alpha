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

resource "aws_subnet" "private" {
  count = length(var.public_cidr)

  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_cidr[count.index]

  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.env_code}-private${count.index+1}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.env_code
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.env_code}-public"
  }
}