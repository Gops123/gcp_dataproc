output "public_ip" {
  value = "${google_dataproc_cluster.data.cluster_config.0.gce_cluster_config.0.internal_ip_only}"
}
