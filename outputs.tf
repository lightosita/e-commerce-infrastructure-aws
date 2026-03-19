# --- VPC Outputs ---
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# --- EKS Outputs ---
output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

# Public URL customers use to reach your application
output "eks_alb_dns" {
  description = "ALB DNS name for EKS"
  value       = module.eks.alb_dns_name
}

# --- EC2 Outputs ---
output "ec2_asg_name" {
  description = "EC2 Auto Scaling Group name"
  value       = module.ec2.autoscaling_group_name
}

# --- RDS Outputs ---
output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.endpoint
}

output "rds_db_name" {
  description = "RDS database name"
  value       = module.rds.db_name
}

# --- Redis Outputs ---
output "redis_endpoint" {
  description = "Redis endpoint"
  value       = module.redis.endpoint
}

# --- S3 Outputs ---
output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_names
}