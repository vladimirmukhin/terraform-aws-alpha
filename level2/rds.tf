module "rds" {
  source = "../modules/rds"

  env_code              = var.env_code 
  subnet_ids            = data.terraform_remote_state.level1.outputs.private_subnet_ids
  vpc_id                = data.terraform_remote_state.level1.outputs.vpc_id
  db_name               = "mydb"
  db_user               = "admin"
  db_password           = jsondecode(data.aws_secretsmanager_secret_version.rds_password.secret_string)["password"]
  source_security_group = module.asg.security_group_id
}
