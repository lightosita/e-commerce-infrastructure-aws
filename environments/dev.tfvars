# --- General ---
# Cheap and minimal - for development and testing only
environment = "dev"
aws_region  = "us-east-1"

# --- VPC ---
# Single AZ only - no redundancy needed in dev
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = true

# --- EKS ---
# Smallest nodes - just enough to run and test
eks_node_instance_types = ["t3.small"]
eks_node_desired        = 1
eks_node_min            = 1
eks_node_max            = 2

# --- EC2 ---
# Single instance - no scaling needed in dev
ec2_instance_type    = "t3.micro"
ec2_desired_capacity = 1
ec2_min_size         = 1
ec2_max_size         = 1

# --- RDS ---
# Smallest database - no Multi-AZ, minimal backup
rds_instance_class    = "db.t3.micro"
rds_allocated_storage = 20
rds_multi_az          = false
rds_backup_retention  = 1

# --- Redis ---
# Single cache node - no redundancy needed
redis_node_type = "cache.t3.micro"
redis_num_nodes = 1

# --- S3 ---
# No versioning - force destroy allowed for easy cleanup
s3_versioning     = false
s3_force_destroy  = true
s3_lifecycle_days = 30