provider "mongodbatlas" {
  public_key  = var.public_key
  private_key = var.private_key
  project_id  = var.project_id
}

# Dynamically load approved cluster definitions
module "approved_clusters" {
  source = "./modules/cluster"

  for_each = fileset("./clusters/approved", "*.tf")

  # Pass developer-defined inputs from approved clusters
  cluster_name               = each.key
  provider_instance_size_name = each.value
}

