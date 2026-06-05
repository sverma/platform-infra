resource "google_container_cluster" "gke" {

  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  workload_identity_config {
    workload_pool = "${data.google_project.project.project_id}.svc.id.goog"
  }

  ip_allocation_policy { 
    cluster_secondary_range_name = "${var.name}-pods" 
    services_secondary_range_name = "${var.name}-services" 
  }
}

data "google_project" "project" {}

resource "google_container_node_pool" "primary" {

  name     = "primary-node-pool"
  cluster  = google_container_cluster.gke.name
  location = var.region

  node_count = var.primary_pool_node_count

  node_config {
    machine_type = "e2-standard-2"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    disk_size_gb = var.node_disk_size
  }
}
