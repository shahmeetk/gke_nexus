# Specify the GCP Provider
provider "google" {
project = var.project_id
region  = var.region
}

# Specify the Helm Provider
provider "helm" {
  version        = "~> 0.9"
  install_tiller = true
}



# Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
name     = var.bucket_name
location = var.region
}

output "kubernetes_bucket_name" {
  value       = google_storage_bucket.my_bucket.name
  description = "GKE Bucket Name"
}