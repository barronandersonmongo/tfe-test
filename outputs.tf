output "cluster_ids" {
  description = "Map of cluster IDs by request filename"
  value = {
    for key, mod in module.cluster :
    key => mod.cluster_id
  }
}

output "cluster_names" {
  description = "Map of cluster names by request filename"
  value = {
    for key, mod in module.cluster :
    key => mod.cluster_name
  }
}

output "cluster_connection_strings" {
  description = "Map of connection strings for each cluster"
  value = {
    for key, mod in module.cluster :
    key => mod.cluster_connection_strings
  }
}
