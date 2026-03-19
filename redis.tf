# --- Redis Module ---
# ElastiCache Redis for sessions and frequently accessed data
# Deployed in private subnets - VPC internal access only
module "redis" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-redis"

  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_cidr           = module.vpc.vpc_cidr
  node_type          = var.redis_node_type
  num_cache_nodes    = var.redis_num_nodes
}
