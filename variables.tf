# --- General Configuration ---
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix for all resources"
  type        = string
  default     = "teleios-light"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Must be dev, staging, or prod."
  }
}

# --- VPC Configuration ---
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Use a single NAT Gateway to save costs"
  type        = bool
  default     = true
}

# --- EKS Configuration ---
variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "eks_node_instance_types" {
  description = "Instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_desired" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 2
}

variable "eks_node_min" {
  description = "Minimum EKS nodes"
  type        = number
  default     = 1
}

variable "eks_node_max" {
  description = "Maximum EKS nodes"
  type        = number
  default     = 4
}

# --- EC2 Configuration ---
variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ec2_desired_capacity" {
  description = "Desired number of EC2 instances"
  type        = number
  default     = 1
}

variable "ec2_min_size" {
  description = "Minimum EC2 instances in ASG"
  type        = number
  default     = 1
}

variable "ec2_max_size" {
  description = "Maximum EC2 instances in ASG"
  type        = number
  default     = 3
}

# --- RDS Configuration ---
variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "RDS storage in GB"
  type        = number
  default     = 20
}

variable "rds_multi_az" {
  description = "Enable Multi-AZ for RDS"
  type        = bool
  default     = false
}

variable "rds_backup_retention" {
  description = "RDS backup retention in days"
  type        = number
  default     = 7
}

# --- Database Password ---
# Never stored in code - injected from Terraform Cloud at runtime
variable "db_password" {
  description = "Database master password (set in Terraform Cloud, never in code)"
  type        = string
  sensitive   = true
}

# --- Redis Configuration ---
variable "redis_node_type" {
  description = "ElastiCache node type"
  type        = string
  default     = "cache.t3.micro"
}

variable "redis_num_nodes" {
  description = "Number of Redis cache nodes"
  type        = number
  default     = 1
}

# --- S3 Configuration ---
variable "s3_force_destroy" {
  description = "Allow bucket deletion with objects inside"
  type        = bool
  default     = false
}

variable "s3_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "s3_lifecycle_days" {
  description = "Days before objects expire (0 = never)"
  type        = number
  default     = 0
}