# --- VPC Module ---
# Foundation of the entire infrastructure
# All other modules depend on this module's outputs
module "vpc" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
}
