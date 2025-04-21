module "cluster" {
  source = "./modules/cluster"

  private_key                 = var.private_key
  public_key                  = var.public_key
  org_id                      = var.org_id
  project_id                  = var.project_id
  cluster_name                = var.cluster_name
  provider_instance_size_name = var.provider_instance_size_name
  provider_name               = var.provider_name
  provider_region             = var.provider_region
  backup_enabled              = var.backup_enabled
  num_shards                  = var.num_shards
}


