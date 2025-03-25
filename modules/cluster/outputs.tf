output "cluster_id" {
  value = mongodbatlas_cluster.this.id
}

output "cluster_name" {
  value = mongodbatlas_cluster.this.name
}

output "cluster_connection_strings" {
  value = mongodbatlas_cluster.this.connection_strings
}
