resource "google_service_account" "externaldns" {

  account_id = "externaldns"

  display_name = "ExternalDNS"
}


resource "google_project_iam_member" "externaldns_dns_admin" {

  project = var.project_id

  role = "roles/dns.admin"

  member = "serviceAccount:${google_service_account.externaldns.email}"
}


resource "google_service_account_iam_member" "workload_identity" {

  service_account_id = google_service_account.externaldns.name

  role = "roles/iam.workloadIdentityUser"

  member = "serviceAccount:${var.project_id}.svc.id.goog[external-dns/external-dns]"
}

