terraform {
backend "gcs" {
  bucket = "aliz-hw-shahmeet-nexus-bucket"   # GCS bucket name to store terraform tfstate
  prefix = "nexus-app-tffiles"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}