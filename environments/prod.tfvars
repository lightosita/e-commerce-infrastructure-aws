# --- General ---
# Full scale production - complete redundancy and high availability
environment = "prod"
aws_region  = "us-east-1"

# --- VPC ---
# Three AZs - maximum resilience across data centers
vpc_cidr             = "10.2.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnet_cidrs = ["10.2.10.0/24", "10.2.11.0/24", "10.2.12.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = false

# --- EKS ---
# Large nodes - handles real production traffic
eks_node_instance_types = ["t3.large"]
eks_node_desired        = 3
eks_node_min            = 3
eks_node_max            = 10

# --- EC2 ---
# Multiple instances across AZs - full auto scaling
ec2_instance_type    = "t3.medium"
ec2_desired_capacity = 3
ec2_min_size         = 2
ec2_max_size         = 6

# --- RDS ---
# Large instance - Multi-AZ enabled, 30 day backup retention
rds_instance_class    = "db.t3.medium"
rds_allocated_storage = 100
rds_multi_az          = true
rds_backup_retention  = 30

# --- Redis ---
# Multiple nodes - cache redundancy for production
redis_node_type = "cache.t3.medium"
redis_num_nodes = 2

# --- S3 ---
# Versioning on, no expiry - retain all assets permanently
s3_versioning     = true
s3_force_destroy  = false
s3_lifecycle_days = 0