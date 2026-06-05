resource "google_compute_network" "vpc" {
    name = "${var.name}-vpc"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {

  name = "${var.name}-subnet"

  region = var.region

  network = google_compute_network.vpc.id

  ip_cidr_range = var.subnet_cidr

  secondary_ip_range {

    range_name = "${var.name}-pods"

    ip_cidr_range = var.pods_cidr
  }

  secondary_ip_range {

    range_name = "${var.name}-services"

    ip_cidr_range = var.services_cidr
  }
}

