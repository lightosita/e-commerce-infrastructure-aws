# --- RDS Module ---
# PostgreSQL database for storing application data
# Deployed in private subnets - never publicly accessible
module "rds" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-rds"

  project_name            = var.project_name
  environment             = var.environment
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  vpc_cidr                = module.vpc.vpc_cidr
  instance_class          = var.rds_instance_class
  allocated_storage       = var.rds_allocated_storage
  db_password             = var.db_password
  multi_az                = var.rds_multi_az
  backup_retention_period = var.rds_backup_retention
}
