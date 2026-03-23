# --- cert-manager ---
# Automates X.509 TLS certificate provisioning and renewal
# Integrates with Let's Encrypt ACME protocol for free certificates
# Required by: NGINX Ingress for TLS termination, all HTTPS services
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  version          = "v1.14.0"
  namespace        = "cert-manager"
  create_namespace = true

  # installCRDs deploys Custom Resource Definitions:
  # Certificate, CertificateRequest, Issuer, ClusterIssuer
  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [module.eks]
}
