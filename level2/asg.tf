module "asg" {
  source = "../modules/asg"

  env_code         = var.env_code
  vpc_id           = data.terraform_remote_state.level1.outputs.vpc_id
  subnet_id        = data.terraform_remote_state.level1.outputs.private_subnet_ids
  lb_sg_id         = module.load_balancer.load_balancer_sg
  target_group_arn = module.load_balancer.target_group_arn
}
