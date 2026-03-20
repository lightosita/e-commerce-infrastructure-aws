# e-commerce-infrastructure-aws

Production-grade AWS infrastructure for a scalable e-commerce platform, built with Terraform modules and managed via Terraform Cloud.

---

## Repository Structure
```
e-commerce-infrastructure-aws/
├── .gitignore
├── .terraform.lock.hcl
├── README.md
├── backends/
│   ├── dev.hcl
│   ├── staging.hcl
│   └── prod.hcl
├── environments/
│   ├── dev.tfvars
│   ├── staging.tfvars
│   └── prod.tfvars
├── providers.tf
├── variables.tf
├── outputs.tf
├── vpc.tf
├── eks.tf
├── ec2.tf
├── rds.tf
├── redis.tf
└── s3.tf
```

---

## Architecture

This repository wires together six reusable Terraform modules:

| Module | Purpose |
|--------|---------|
| terraform-aws-vpc | VPC, subnets, NAT Gateway, route tables |
| terraform-aws-eks | EKS cluster, node groups, ALB |
| terraform-aws-ec2 | Auto Scaling Groups, Launch Templates |
| terraform-aws-rds | PostgreSQL RDS with Multi-AZ support |
| terraform-aws-redis | ElastiCache Redis cluster |
| terraform-aws-s3 | S3 buckets with encryption and versioning |

---

## Prerequisites

- Terraform >= 1.0
- AWS credentials configured in Terraform Cloud
- Terraform Cloud organisation: `teleios`
- GitHub access to: `github.com/lightosita/terraform-aws-modules`

---

## How to Deploy

Each environment has its own backend config and tfvars file.
The workspace is selected at init time — no code changes needed between environments.

### Dev
```bash
terraform init -backend-config=backends/dev.hcl
terraform plan -var-file=environments/dev.tfvars
terraform apply -var-file=environments/dev.tfvars
```

### Staging
```bash
terraform init -backend-config=backends/staging.hcl
terraform plan -var-file=environments/staging.tfvars
terraform apply -var-file=environments/staging.tfvars
```

### Production
```bash
terraform init -backend-config=backends/prod.hcl
terraform plan -var-file=environments/prod.tfvars
terraform apply -var-file=environments/prod.tfvars
```

---

## How to Destroy

Always destroy immediately after verifying a successful deployment.
```bash
# Dev
terraform destroy -var-file=environments/dev.tfvars

# Staging
terraform destroy -var-file=environments/staging.tfvars

# Prod
terraform destroy -var-file=environments/prod.tfvars
```

---

## Environment Configuration

| Setting | dev | staging | prod |
|---------|-----|---------|------|
| Availability Zones | 2 | 2 | 3 |
| NAT Gateway | Single | Single | One per AZ |
| EKS Node Type | t3.small | t3.medium | t3.large |
| EKS Desired Nodes | 1 | 2 | 3 |
| RDS Instance | db.t3.micro | db.t3.small | db.t3.medium |
| RDS Multi-AZ | false | true | true |
| RDS Backup Days | 1 | 7 | 30 |
| Redis Nodes | 1 | 1 | 2 |
| S3 Versioning | false | true | true |
| S3 Force Destroy | true | false | false |

---

## Sensitive Variables

Never stored in code. Set in each Terraform Cloud workspace:

| Variable | Type | Sensitive |
|----------|------|-----------|
| `db_password` | Terraform variable | Yes |
| `AWS_ACCESS_KEY_ID` | Environment variable | Yes |
| `AWS_SECRET_ACCESS_KEY` | Environment variable | Yes |
| `AWS_DEFAULT_REGION` | Environment variable | No |

---

## Terraform Cloud Workspaces

| Workspace | Environment |
|-----------|-------------|
| `teleios-light-dev` | Development |
| `teleios-light-staging` | Staging |
| `teleios-light-prod` | Production |

---

## Resource Naming Convention

All resources follow the pattern: `teleios-light-<environment>-<resource>`

| Example Resource | Name |
|-----------------|------|
| VPC | `teleios-light-dev-vpc` |
| EKS Cluster | `teleios-light-prod-eks` |
| RDS Instance | `teleios-light-staging-rds` |
| Redis Cluster | `teleios-light-dev-redis` |
| S3 Bucket | `teleios-light-prod-assets` |
| Security Group | `teleios-light-dev-eks-sg` |

---

## Modules Repository

[terraform-aws-modules](https://github.com/lightosita/terraform-aws-modules)

---

## Cost Management

All resources must be destroyed immediately after verification.
- Dev uses minimal instance types to reduce cost
- Single NAT Gateway in dev and staging
- `force_destroy = true` on S3 in dev for easy cleanup
