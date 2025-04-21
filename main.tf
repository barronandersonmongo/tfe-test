terraform {
  required_version = ">= 1.3.0"

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


locals {
  cluster_files = fileset("${path.module}/requests", "*.yaml")

  cluster_requests = {
    for file in local.cluster_files :
    trimsuffix(file, ".yaml") => yamldecode(file("${path.module}/requests/${file}"))
  }
}


module "cluster" {
  for_each = local.cluster_requests
  source   = "./modules/cluster"

  private_key                  = var.private_key
  public_key                   = var.public_key
  org_id                       = var.org_id
  project_id                   = var.project_id
  cluster_name                 = each.value.cluster_name
  provider_instance_size_name = each.value.provider_instance_size_name
  provider_name                = var.provider_name
  provider_region              = var.provider_region
  backup_enabled               = var.backup_enabled
  num_shards                   = var.num_shards
}
