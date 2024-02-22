resource "google_storage_bucket" "bucket" {
 name     = "mibucketalex77"
 location = var.region
 project = var.project
 uniform_bucket_level_access = true
 public_access_prevention    = "inherited"
}

resource "google_storage_bucket_iam_binding" "binding" {
 bucket = google_storage_bucket.bucket.name
 role   = "roles/storage.admin"

 members = ["serviceAccount:${google_service_account.filemageSA.email}"]
}

resource "google_service_account" "filemageSA" {
 account_id   = "filemage"
 display_name = "filemage"
 project      = var.project
}
