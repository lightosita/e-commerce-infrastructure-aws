# --- Terraform Settings ---
# Connects to Terraform Cloud for remote state management
# To switch environments, change the workspace name below
terraform {
  cloud {
    organization = "teleios"

    workspaces {
      name = "teleios-light-dev"
    }
  }

  # AWS Provider version pinned to 5.x for stability
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# --- AWS Provider Configuration ---
provider "aws" {
  region = var.aws_region

  # Default tags applied to EVERY resource Terraform creates
  default_tags {
    tags = {
      Project     = "teleios-ecommerce"
      Owner       = "light"
      ManagedBy   = "terraform"
      Environment = var.environment
    }
  }
}
