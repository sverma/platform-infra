output "network" {
  value = google_compute_network.vpc.id
}

output "subnetwork" {
  value = google_compute_subnetwork.subnet.id
}

