# e-commerce-infrastructure-aws

Production-grade AWS infrastructure for a scalable e-commerce platform, built with Terraform modules and managed via Terraform Cloud.

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

---

## How to Deploy

Each environment has its own backend config and tfvars file.

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
terraform destroy -var-file=environments/<env>.tfvars
```

---

## Environment Configuration

| Setting | dev | staging | prod |
|---------|-----|---------|------|
| Availability Zones | 2 | 2 | 3 |
| EKS Node Type | t3.small | t3.medium | t3.large |
| RDS Instance | db.t3.micro | db.t3.small | db.t3.medium |
| RDS Multi-AZ | false | true | true |
| NAT Gateway | Single | Single | One per AZ |

---

## Sensitive Variables

Never stored in code. Set in Terraform Cloud workspace variables:

- `db_password` — RDS master password (Terraform variable, sensitive)
- `AWS_ACCESS_KEY_ID` — AWS credentials (Environment variable, sensitive)
- `AWS_SECRET_ACCESS_KEY` — AWS credentials (Environment variable, sensitive)

---

## Modules Repository

[terraform-aws-modules](https://github.com/lightosita/terraform-aws-modules)

---

## Resource Naming Convention

All resources follow the pattern: `teleios-light-<environment>-<resource>`

Examples:
- `teleios-light-dev-vpc`
- `teleios-light-prod-eks`
- `teleios-light-staging-rds`
