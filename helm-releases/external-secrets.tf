# --- External Secrets Operator ---
# Synchronises secrets from AWS Secrets Manager into Kubernetes Secret objects
# Enables GitOps-compatible secret management without storing secrets in Git
# Required by: all microservices that consume secrets from AWS Secrets Manager
resource "helm_release" "external_secrets" {
  name             = "external-secrets"
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
  version          = "0.9.11"
  namespace        = "external-secrets"
  create_namespace = true

  depends_on = [module.eks]
}
