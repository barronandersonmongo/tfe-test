variable "cluster_name" {
  description = "Name of the MongoDB Atlas cluster"
  type        = string
}

variable "provider_instance_size_name" {
  description = "Atlas tier size"
  type        = string
}

# Immutable parameters baked into the module
resource "mongodbatlas_cluster" "this" {
  project_id                   = var.project_id
  name                         = var.cluster_name
  provider_name                = "AWS"
  provider_region_name         = "US_WEST_2"
  provider_instance_size_name  = var.provider_instance_size_name
  num_shards                   = 1

  replication_specs {
    region_configs {
      region_name     = "US_WEST_2"
      electable_nodes = 3
    }
  }
}

