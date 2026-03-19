# --- General ---
# Medium scale - tests high availability patterns
environment = "staging"
aws_region  = "us-east-1"

# --- VPC ---
# Two AZs - starts testing multi-AZ resilience
vpc_cidr             = "10.1.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = true

# --- EKS ---
# Medium nodes - tests real workload performance
eks_node_instance_types = ["t3.medium"]
eks_node_desired        = 2
eks_node_min            = 2
eks_node_max            = 4

# --- EC2 ---
# Multiple instances - tests auto scaling behaviour
ec2_instance_type    = "t3.small"
ec2_desired_capacity = 2
ec2_min_size         = 1
ec2_max_size         = 3

# --- RDS ---
# Multi-AZ enabled - validates high availability failover
rds_instance_class    = "db.t3.small"
rds_allocated_storage = 50
rds_multi_az          = true
rds_backup_retention  = 7

# --- Redis ---
# Single node - cache resilience tested in prod
redis_node_type = "cache.t3.small"
redis_num_nodes = 1

# --- S3 ---
# Versioning on - mirrors prod behaviour
s3_versioning     = true
s3_force_destroy  = false
s3_lifecycle_days = 90 