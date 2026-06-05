resource "google_dns_managed_zone" "public_zone" {

  project = var.project_id

  name = var.zone_name

  dns_name = "${var.domain_name}."

  description = "Public DNS zone"

  visibility = "public"

  dnssec_config {
    state = "on"
  }
}

