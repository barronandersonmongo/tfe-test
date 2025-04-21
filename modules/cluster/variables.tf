variable "public_key" {
  description = "MongoDB Atlas API public key"
  type        = string
}

variable "private_key" {
  description = "MongoDB Atlas API private key"
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "MongoDB Atlas Project ID"
  type        = string
}

variable "org_id" {
  description = "MongoDB Atlas Organization ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}

variable "provider_name" {
  description = "Name of the cloud provider (e.g. AWS, Azure, GCP)"
  type        = string
}

variable "provider_region" {
  description = "Name of the cloud provider region (e.g. AWS: US_EAST, Azure: US_SOUTH_CENTRAL, GCP: US_CENTRAL1)"
  type        = string
}

variable "provider_instance_size_name" {
  description = "Name of the cloud provider instance size (e.g. M10, M20, M30)"
  type        = string
}

variable "backup_enabled" {
  description = "Enable backup for the cluster"
  type        = bool
}

variable "num_shards" {
  description = "Number of shards for the cluster"
  type        = number
}
