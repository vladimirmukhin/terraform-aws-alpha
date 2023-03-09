resource "aws_db_subnet_group" "this" {
  name       = var.env_code
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.env_code
  }
}

resource "aws_security_group" "this" {
  name = "${var.env_code}-rds"
  vpc_id = var.vpc_id

  ingress {
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    security_groups = [var.source_security_group]
  }

  tags = {
    Name = var.env_code
  }
}

resource "aws_db_instance" "this" {
  identifier             = var.env_code
  allocated_storage      = 10
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_user
  password               = var.db_password
  multi_az               = true
  vpc_security_group_ids = [aws_security_group.this.id]
  db_subnet_group_name   = aws_db_subnet_group.this.name
  skip_final_snapshot    = true

  tags = {
    Name = var.env_code
  }
}