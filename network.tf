resource "google_compute_network" "vpc" {
  name                    = "filemage-vpc"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "filemage_vpc" {
  ip_cidr_range              = "10.132.0.0/20"
  name                       = "filemage-vpc"
  network                    =  google_compute_network.vpc.self_link
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "pr-sandboxapigee-alex"
  purpose                    = "PRIVATE"
  region                     = "europe-west1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_firewall" "app" {
  name          = "filemage-app"
  network       = google_compute_network.vpc.self_link
  priority      = "1001"
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["443", "21", "22", "2222", "80", "32768-65535"]
  }

  target_tags = ["filemage-app"]
}
