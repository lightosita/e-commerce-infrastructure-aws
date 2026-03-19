# e-commerce-infrastructure-aws


---

**How it works:**
- ONE providers.tf file for all environments
- Before deploying to dev you run:
```
export TF_WORKSPACE=teleios-light-dev
```
- Before deploying to staging:
```
export TF_WORKSPACE=teleios-light-staging
```
- Before deploying to prod:
```
export TF_WORKSPACE=teleios-light-prod
