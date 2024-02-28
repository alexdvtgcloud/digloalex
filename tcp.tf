
resource "google_compute_address" "ip_address" {
  name         = "filemage-external-ip"
  region        = var.region  
  
}
resource "google_compute_forwarding_rule" "nuevo21" {
  ip_address            = google_compute_address.ip_address.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "nuevo21"
  network_tier          = "PREMIUM"
  port_range            = "21-21"
  project               = var.project
  region                = var.region
  target                = google_compute_target_pool.nuevo.self_link
}

resource "google_compute_forwarding_rule" "nuevo2222" {
  ip_address            = google_compute_address.ip_address.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "nuevo2222"
  network_tier          = "PREMIUM"
  port_range            = "2222-2222"
  project               = var.project
  region                = var.region
  target                = google_compute_target_pool.nuevo.self_link
}

resource "google_compute_forwarding_rule" "nuevo32768_60999" {
  ip_address            = google_compute_address.ip_address.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "nuevo32768-60999"
  network_tier          = "PREMIUM"
  port_range            = "32768-60999"
  project               = var.project
  region                = var.region
  target                = google_compute_target_pool.nuevo.self_link
}

resource "google_compute_forwarding_rule" "nuevo443" {
  ip_address            = google_compute_address.ip_address.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "nuevo443"
  network_tier          = "PREMIUM"
  port_range            = "443-443"
  project               = var.project
  region                = var.region
  target                = google_compute_target_pool.nuevo.self_link
}

resource "google_compute_forwarding_rule" "nuevo80" {
  ip_address            = google_compute_address.ip_address.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "nuevo80"
  network_tier          = "PREMIUM"
  port_range            = "80-80"
  project               = var.project
  region                = var.region
  target                = google_compute_target_pool.nuevo.self_link
}

resource "google_compute_target_pool" "nuevo" {
  instances        = ["europe-west1-b/filemage-app"]
  name             = "nuevo"
  project          = var.project
  region           = var.region
  session_affinity = "NONE"
}