
resource "google_service_account" "filemageSA" {
 account_id   = "filemage-abanca"
 display_name = "filemage-abanca"
 project      = var.project
}

