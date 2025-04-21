resource "mongodbatlas_cluster" "this" {
  project_id                   = var.project_id
  name                         = var.cluster_name
  backup_enabled               = var.backup_enabled
  cluster_type                 = "REPLICASET"
  provider_name                = var.provider_name
  provider_region_name         = var.provider_region
  provider_instance_size_name  = var.provider_instance_size_name
}

