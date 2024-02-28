data "google_compute_image" "filemage_public_image" {
  family  = "filemage-ubuntu"
  project = "filemage-public"
}

resource "google_compute_instance" "filemage" {
  name         = "filemage-app"
  machine_type = "n2-standard-2"
  tags         = [
    "filemage-app"
  ]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.filemage_public_image.self_link
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.filemage_vpc.self_link
    network_ip = "10.132.0.2"
    access_config {}
  }

 service_account {
    email = google_service_account.filemageSA.email
    scopes = ["https://www.googleapis.com/auth/devstorage.full_control"]
 }
}

