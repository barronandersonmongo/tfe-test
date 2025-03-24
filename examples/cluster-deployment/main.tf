module "cluster" {
  source = "../../modules/cluster"

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

# Module for requested clusters (planning only)
# module "requested_clusters" {
#   source = "../../modules/cluster"

#   for_each = tomap({
#     for f in fileset("./new_cluster_requests", "*.yaml") : f => {
#       cluster_name                = yamldecode(file("./new_cluster_requests/${f}"))["cluster_name"]
#       provider_instance_size_name = yamldecode(file("./new_cluster_requests/${f}"))["provider_instance_size_name"]
#     }
#   })

#   private_key                 = var.private_key
#   public_key                  = var.public_key
#   org_id                      = var.org_id
#   project_id                  = var.project_id
#   cluster_name                = each.value.cluster_name
#   provider_instance_size_name = each.value.provider_instance_size_name
#   provider_name               = var.provider_name
#   provider_region             = var.provider_region
#   backup_enabled              = var.backup_enabled
#   num_shards                  = var.num_shards
# }

# Module for approved clusters (apply changes)
# module "approved_clusters" {
#   source = "../modules/cluster"

#   for_each = tomap({
#     for f in fileset("./approved_cluster_requests", "*.yaml") : f => {
#       cluster_name                = yamldecode(file("./approved_cluster_requests/${f}"))["cluster_name"]
#       provider_instance_size_name = yamldecode(file("./approved_cluster_requests/${f}"))["provider_instance_size_name"]
#     }
#   })

#   private_key                 = var.private_key
#   public_key                  = var.public_key
#   org_id                      = var.org_id
#   project_id                  = var.project_id
#   cluster_name                = each.value.cluster_name
#   provider_instance_size_name = each.value.provider_instance_size_name
#   provider_name               = var.provider_name
#   provider_region             = var.provider_region
#   backup_enabled              = var.backup_enabled
#   num_shards                  = var.num_shards
# }
