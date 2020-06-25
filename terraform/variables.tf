variable "project_id" {
description = "Google Project ID."
type        = string
}

variable "bucket_name" {
description = "GCS Bucket name. Value should be unique ."
type        = string
}

variable "region" {
description = "Google Cloud region"
type        = string
default     = "us-central1"
}

variable "zone" {
description = "Google Cloud Zone"
type        = string
default     = "us-central1-a"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}


variable "config_path" {
  description = "path to a kubernetes config file"
}
variable "k8s_yaml" {
  description = "path to a kubernetes yaml file to apply"
}