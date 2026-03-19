# --- EC2 Module ---
# Auto scaling web and app servers
# Instances deployed in private subnets
module "ec2" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-ec2"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.ec2_instance_type
  desired_capacity   = var.ec2_desired_capacity
  min_size           = var.ec2_min_size
  max_size           = var.ec2_max_size
}
