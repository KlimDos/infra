resource "google_compute_firewall" "reddit-db" {
  name    = "reddit-db"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  target_tags   = ["reddit-db"]
  source_tags = ["reddit-app"]
}