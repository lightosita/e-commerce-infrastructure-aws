# --- Terraform Settings ---
# To switch environments, change the workspace name below
terraform {
  cloud {
    organization = "teleios"

    workspaces {
      name = "teleios-light-dev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

# --- AWS Provider ---
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "teleios-ecommerce"
      Owner       = "light"
      ManagedBy   = "terraform"
      Environment = var.environment
    }
  }
}

# --- EKS Cluster Auth ---

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

# --- Kubernetes Provider ---
# Connects Terraform to the EKS cluster API server
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority)
  token                  = data.aws_eks_cluster_auth.this.token
}

# --- Helm Provider ---
# Connects Terraform to Helm for installing cluster add-ons
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}
