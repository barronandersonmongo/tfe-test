terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.9.0"
    }
  }
}

variable "project_id" {
  description = "MongoDB Atlas Project ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the MongoDB Atlas cluster"
  type        = string
}

variable "provider_instance_size_name" {
  description = "Atlas tier size"
  type        = string
}

resource "mongodbatlas_cluster" "this" {
  project_id                   = var.project_id
  name                         = var.cluster_name
  backup_enabled               = false
  cluster_type                 = "REPLICASET"
  provider_name                = "AWS"
  provider_region_name         = "US_WEST_2"
  provider_instance_size_name  = var.provider_instance_size_name

  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "US_WEST_2"
      electable_nodes = 3
      priority        = 7
    }
  }
}

