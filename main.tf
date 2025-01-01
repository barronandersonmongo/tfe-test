terraform {
  required_providers {
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "~> 1.9.0"
    }
  }
}

provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
}

# Module for requested clusters (planning only)
module "requested_clusters" {
  source = "./modules/cluster"

  for_each = tomap({
    for f in fileset("./new_cluster_requests", "*.yaml") : f => {
      cluster_name                = yamldecode(file("./new_cluster_requests/${f}"))["cluster_name"]
      provider_instance_size_name = yamldecode(file("./new_cluster_requests/${f}"))["provider_instance_size_name"]
    }
  })

  cluster_name                = each.value.cluster_name
  provider_instance_size_name = each.value.provider_instance_size_name
  project_id                  = var.project_id
}

# Module for approved clusters (apply changes)
module "approved_clusters" {
  source = "./modules/cluster"

  for_each = tomap({
    for f in fileset("./approved_cluster_requests", "*.yaml") : f => {
      cluster_name                = yamldecode(file("./approved_cluster_requests/${f}"))["cluster_name"]
      provider_instance_size_name = yamldecode(file("./approved_cluster_requests/${f}"))["provider_instance_size_name"]
    }
  })

  cluster_name                = each.value.cluster_name
  provider_instance_size_name = each.value.provider_instance_size_name
  project_id                  = var.project_id
}

