# --- S3 Module ---
# Object storage for product images, static files and backups
# Independent module - no VPC dependency
module "s3" {
  source = "git::https://github.com/lightosita/terraform-aws-modules.git//terraform-aws-s3"

  project_name              = var.project_name
  environment               = var.environment
  bucket_names              = ["assets", "backups", "static"]
  enable_versioning         = var.s3_versioning
  lifecycle_expiration_days = var.s3_lifecycle_days
  force_destroy             = var.s3_force_destroy
}