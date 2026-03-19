# --- EKS Module ---
# Kubernetes cluster for running containerised applications
# Worker nodes in private subnets, ALB in public subnets
module "eks" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-eks"

  project_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids
  kubernetes_version  = var.kubernetes_version
  node_instance_types = var.eks_node_instance_types
  node_desired_size   = var.eks_node_desired
  node_min_size       = var.eks_node_min
  node_max_size       = var.eks_node_max
}
